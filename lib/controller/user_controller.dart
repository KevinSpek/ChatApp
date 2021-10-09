import 'package:get/get.dart';
import 'package:groupidy/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController {
  var user = Rx<UserGp?>(null);
  final isLoggedIn = false.obs;

  UserController() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        this.isLoggedIn.value = false;
      } else {
        print('User is signed in!');
        this.isLoggedIn.value = true;
      }
    });
  }
}
