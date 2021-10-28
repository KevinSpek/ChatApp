import 'dart:html';
import 'dart:io';

import 'package:get/get.dart';
import 'package:groupidy/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:groupidy/routes/app_pages.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;

  var user = Rx<UserGp?>(null);

  UserController() {
    if (kIsWeb) {
      _auth.setPersistence(Persistence.LOCAL);
    }
  }

  void _userStateChange(User? user) {
    if (user == null) {
      print('User is currently signed out!');
      Get.toNamed(Routes.WELCOME);
    } else {
      print('User is signed in!');
      // TODO: Check if user first time signed in and act accordinly

      Get.toNamed(Routes.HOME);
    }
  }

  void listenToAuthState() {
    _auth.authStateChanges().listen((User? user) {
      _userStateChange(user);
    });
  }

  void registerUser(AuthCredential credential) async {
    UserGp newUser = UserGp(nickname: '', tag: '', uid: '');
    this.user.value = newUser;
    await _auth.signInWithCredential(credential);
  }

  void registerPhone({required String phoneNumber, String smsCode = "", required Function smsVerificationFailed, Function? reCAPTCHAFailed, Function? reCAPTCHASuccess}) async {
    if (kIsWeb) {
      // running on the web!

      if (confirmationResult == null) {
        confirmationResult = await _auth.signInWithPhoneNumber(
            phoneNumber,
            RecaptchaVerifier(
              size: RecaptchaVerifierSize.compact,
              container: null,
              theme: RecaptchaVerifierTheme.dark,
              onError: (FirebaseAuthException error) async {
                print(error);
                if (reCAPTCHAFailed != null) {
                  reCAPTCHAFailed();
                }
              },
              onSuccess: reCAPTCHASuccess != null
                  ? () {
                      reCAPTCHASuccess();
                      final el = window.document.getElementById('__ff-recaptcha-container');
                      if (el != null) {
                        el.style.visibility = 'hidden';
                      }
                    }
                  : () {},
            ));
      } else {
        confirmationResult!.confirm(smsCode).catchError((error) {
          smsVerificationFailed();
        });
      }
    } else {
      // NOT running on the web!

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          registerUser(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          e.printError();
          smsVerificationFailed();
        },
        codeSent: (String verificationId, int? resendToken) async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          registerUser(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // TODO: handle timeout of when automatic sms code handling fails
        },
      );
    }
  }

  void someFunc() async {
    String phone = "";
    ConfirmationResult confirmation = await _auth.signInWithPhoneNumber(phone);
  }

  void signOut() {
    _auth.signOut();
  }
}
