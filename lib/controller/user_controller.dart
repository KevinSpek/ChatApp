// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:chatapp/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:chatapp/routes/app_pages.dart';
import 'package:chatapp/services/firestore_service.dart';
import 'package:chatapp/services/storage_service.dart';
import 'package:chatapp/utils.dart';

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
        codeAutoRetrievalTimeout: (String verificationId) {},
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
        print("User redirects to HOME");
        Get.toNamed(Routes.HOME);
      } else {
        // NO USERE!
        print("User redirects to NEWUSER");
        Get.toNamed(Routes.NEWUSER);
      }
    });
  }

  void updateProfileTag() {
    if (user.value == null) return;
    var newTag = tagGenerator();
    user.value!.tag = newTag;
    user.refresh();
    FirestoreService.updateUser(user.value!.uid, {'tag': newTag});
  }

  void handleUpdateImage(PlatformFile imageData) {
    if (imageData.bytes == null) return;
    if (user.value == null) return;
    StorageService.uploadFile('users/' + user.value!.uid + '/' + imageData.name, imageData.bytes!).then((downloadUrl) {
      FirestoreService.updateGroup(user.value!.uid, {'imgPath': downloadUrl});
      user.value!.imgPath = downloadUrl;
      user.refresh();
    });
  }

  bool isUserExists() => this.user.value != null;
  String getUserUid() => this.user.value?.uid ?? '';
}
