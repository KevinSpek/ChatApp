import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/group_view/group_screen_desktop.dart';
import 'package:groupidy/view/group_view/group_screen_mobile.dart';

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: GroupScreenDesktop(),
      mobile: GroupScreenMobile(),
    );
  }
}
