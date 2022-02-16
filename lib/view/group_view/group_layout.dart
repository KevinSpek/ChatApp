import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/view/group_view/group_screen_desktop.dart';
import 'package:chatapp/view/group_view/group_screen_mobile.dart';

class GroupLayout extends StatefulWidget {
  const GroupLayout({Key? key}) : super(key: key);

  @override
  _GroupLayoutState createState() => _GroupLayoutState();
}

class _GroupLayoutState extends State<GroupLayout> {
  late final ChannelController channelController;
  late final GroupController groupController;

  @override
  void initState() {
    HomeController homeController = Get.find();
    String gid = homeController.currentGroup;
    channelController = Get.put(ChannelController(gid));
    groupController = Get.put(GroupController(gid));
    groupController.loadGroup();
    channelController.loadChannels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: GroupScreenDesktop(),
      mobile: GroupScreenMobile(),
    );
  }
}
