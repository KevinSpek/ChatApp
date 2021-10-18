import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupidy/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:groupidy/routes/app_pages.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  ConfirmationResult? confirmationResult;

  var user = Rx<UserGp?>(null);
  final isLoggedIn = false.obs;

  UserController() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        this.isLoggedIn.value = false;
        Get.toNamed(Routes.WELCOME);
      } else {
        print('User is signed in!');
        this.isLoggedIn.value = true;
        Get.toNamed(Routes.HOME);
      }
    });
  }

  void registerUser(AuthCredential credential, nickname) async {
    UserGp newUser = UserGp(nickname: nickname, tag: '', uid: '');
    this.user.value = newUser;
    await _auth.signInWithCredential(credential);
  }

  void registerPhone({required String phoneNumber, required String nickname, String smsCode = "", required Function verificationFailed}) async {
    if (kIsWeb) {
      // running on the web!

      if (smsCode == "") {
        confirmationResult = await _auth.signInWithPhoneNumber(phoneNumber);
      } else if (confirmationResult != null) {
        UserCredential userCredential = await confirmationResult!.confirm(smsCode);
        if (userCredential.credential != null) {
          registerUser(userCredential.credential!, nickname);
        } else {
          verificationFailed();
        }
      } else {
        // Problem with signing in...
        print("Issue with signing in...");
      }
    } else {
      // NOT running on the web!

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // TODO: User Registered
          // todo: Implement uid and tag
          registerUser(credential, nickname);
        },
        verificationFailed: (FirebaseAuthException e) {
          e.printError();
          verificationFailed();
        },
        codeSent: (String verificationId, int? resendToken) async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // todo: Implement uid and tag
          registerUser(credential, nickname);
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
}
