import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/view/group_view/channel_create.dart';
import 'package:chatapp/view/group_view/channel_layout.dart';
import 'package:chatapp/view/group_view/group_bar_info.dart';
import 'package:chatapp/view/group_view/group_menu.dart';

import 'group_information.dart';

class GroupScreenDesktop extends StatefulWidget {
  const GroupScreenDesktop({Key? key}) : super(key: key);

  @override
  _GroupScreenDesktopState createState() => _GroupScreenDesktopState();
}

class _GroupScreenDesktopState extends State<GroupScreenDesktop> {
  GroupController groupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        GroupMenu(),
        Expanded(
            child: Container(
                color: kSecondaryBackground,
                child: Column(
                  children: [
                    GroupBarInfo(),
                    Obx(() {
                      switch (groupController.mode.value) {
                        case Mode.content:
                          return ChannelLayout();
                        case Mode.info:
                          return GroupInformation();
                        case Mode.add:
                          return ChannelCreate();
                      }
                    }),
                  ],
                ))),
      ],
    ));
  }
}
