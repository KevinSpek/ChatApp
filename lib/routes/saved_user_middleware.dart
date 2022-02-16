import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/routes/app_pages.dart';

class SavedUserMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();

    if (userController.isUserExists()) {
      return RouteSettings(name: Routes.HOME);
    }
  }
}
