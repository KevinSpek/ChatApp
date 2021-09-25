import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/view/home_views/home_groups.dart';
import 'package:groupidy/view/home_views/home_presentor.dart';

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
          SizedBox(
            child: HomeMenu(),
            width: 200,
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
                    homeController.getTitle(homeController.homeType.value),
                    style: kTitle3,
                  ),
                ),
              ),
              body: Container(
                  width: double.infinity,
                  child: Obx(
                    () => HomePresentor(
                      homeType: homeController.homeType.value,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
