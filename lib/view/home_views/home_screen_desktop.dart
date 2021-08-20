import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/home_controller.dart';

import 'home_menu.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: HomeMenu(),
            flex: 1,
          ),
          Expanded(
            child: Obx(() => Text(homeController.homeItems.string)),
            flex: 6,
          )
        ],
      ),
    );
  }
}
