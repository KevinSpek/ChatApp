import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupidy/routes/app_pages.dart';

class LoggedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (_auth.currentUser != null) {
      return RouteSettings(name: Routes.HOME);
    }
  }
}
