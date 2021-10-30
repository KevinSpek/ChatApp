import 'dart:html';
import 'dart:io';

import 'package:get/get.dart';
import 'package:groupidy/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:groupidy/routes/app_pages.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/utils.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;

  UserGp? _user;

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

      Get.toNamed(Routes.SPLASH);
    }
  }

  void listenToAuthState() {
    _auth.authStateChanges().listen((User? user) {
      _userStateChange(user);
    });
  }

  void registerUser(AuthCredential credential) async {
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

  void createNewUser(String nickname) async {
    if (_auth.currentUser != null) {
      bool isExist = await FirestoreService.isUserExists(_auth.currentUser!.uid);
      if (!isExist) {
        String tag = tagGenerator();
        UserGp newUser = UserGp(nickname: nickname, tag: tag, uid: _auth.currentUser!.uid);
        await FirestoreService.createUser(newUser);
        _user = newUser;
      } else {
        // USER ALREADY EXISTS IN DATA BASE
      }
    } else {
      // USER IS NOT SIGNED IN!
    }
  }

  void fetchUser() {
    if (_auth.currentUser == null) {
      // NO USER!
      print("User not signed in!");
      return;
    }

    FirestoreService.getUser(_auth.currentUser!.uid, (UserGp? userGp) {
      if (userGp != null) {
        this._user = userGp;
      } else {
        // NO USERE!
      }
      print("User redirects....");
      Get.toNamed(Routes.HOME);
    });
  }

  UserGp? getUser() => this._user;
}
