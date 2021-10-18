import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/routes/app_pages.dart';

class NotLoggedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    UserController userController = Get.find();
    if (!userController.isLoggedIn.value) {
      return RouteSettings(name: Routes.WELCOME);
    }
  }
}
