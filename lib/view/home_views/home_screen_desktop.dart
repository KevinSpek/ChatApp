import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/view/home_views/home_presentor.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(
      () => HomePresentor(
        homeType: homeController.homeType.value,
      ),
    ));
  }
}
