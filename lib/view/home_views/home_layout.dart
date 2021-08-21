import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/home_views/home_screen_desktop.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobile: HomeScreenDesktop());
  }
}
