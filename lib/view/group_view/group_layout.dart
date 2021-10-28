import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/group_view/group_screen_desktop.dart';
import 'package:groupidy/view/group_view/group_screen_mobile.dart';

class GroupLayout extends StatefulWidget {
  const GroupLayout({Key? key}) : super(key: key);

  @override
  _GroupLayoutState createState() => _GroupLayoutState();
}

class _GroupLayoutState extends State<GroupLayout> {
  final GroupController groupController = Get.put(GroupController());

  @override 
  void initState() {
    groupController.loadGroup("EjqRFFWIgNItjADAph33");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: GroupScreenDesktop(
        group: dGroup,
        currChannel: pidNews,
      ),
      mobile: GroupScreenMobile(
        currChannel: pidNews,
        group: dGroup,
      ),
    );
  }
}
