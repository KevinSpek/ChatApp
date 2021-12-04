import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupidy/routes/app_pages.dart';

class NotSavedUserMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();

    if (!userController.isUserExists()) {
      return RouteSettings(name: Routes.NEWUSER);
    }
  }
}
