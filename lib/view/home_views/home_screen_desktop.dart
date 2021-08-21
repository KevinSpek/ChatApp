import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';

import '../../typography.dart';
import '../../utils.dart';
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
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
                leading: Container(),
                backgroundColor: kAccentColor,
                centerTitle: true,
                title: Obx(
                  () => Text(
                    capitalize(homeController.homeItems.value.toString().split('.').last),
                    style: kTitle3,
                  ),
                ),
              ),
              body: Text(""),
            ),
            flex: 6,
          )
        ],
      ),
    );
  }
}
