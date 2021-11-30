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
  ConfirmationResult? _confirmationResult;

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

      Get.toNamed(Routes.SPLASH);
      this.fetchUser();
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

      if (_confirmationResult == null) {
        _confirmationResult = await _auth.signInWithPhoneNumber(
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
        _confirmationResult!.confirm(smsCode).catchError((error) {
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
        user.value = newUser;
        Get.toNamed(Routes.HOME);
      } else {
        // USER ALREADY EXISTS IN DATA BASE
        this.fetchUser();
      }
    } else {
      // USER IS NOT SIGNED IN!
      Get.toNamed(Routes.WELCOME);
    }
  }

  void fetchUser() {
    if (_auth.currentUser == null) {
      // NO USER!
      print("User not signed in!");
      Get.toNamed(Routes.WELCOME);
      return;
    }

    FirestoreService.getUser(_auth.currentUser!.uid, (UserGp? userGp) {
      if (userGp != null) {
        this.user.value = userGp;
        Get.toNamed(Routes.HOME);
      } else {
        // NO USERE!
        Get.toNamed(Routes.NEWUSER);
      }
      print("User redirects....");
    });
  }


    void updateProfileTag() {
    if (user.value == null)
      return;
    var newTag = tagGenerator();
    user.value!.tag = newTag;
    user.refresh();
    FirestoreService.updateUser(user.value!.uid, {'tag': newTag});
  }

  
  bool isUserExists() => this.user != null;
  String getUserUid() => this.user.value?.uid ?? '';
}
