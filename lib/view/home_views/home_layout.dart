import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/view/home_views/home_screen_desktop.dart';
import 'package:chatapp/view/home_views/home_screen_mobile.dart';

import 'home_menu.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final HomeController homeController = Get.put(HomeController());
  final UserController userController = Get.find();

  @override
  void initState() {
    homeController.loadGroups(userController.user.value!.gids);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: HomeScreenMobile(),
        desktop: Row(children: [
          HomeMenu(),
          HomeScreenDesktop(),
        ]),
        tablet: Row(children: [
          HomeMenu(),
          HomeScreenDesktop(),
        ]),
      ),
    );
  }
}
