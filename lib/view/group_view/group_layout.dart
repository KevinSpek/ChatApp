import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/group_view/group_screen_desktop.dart';
import 'package:groupidy/view/group_view/group_screen_mobile.dart';

class GroupLayout extends StatefulWidget {
  const GroupLayout({Key? key}) : super(key: key);

  @override
  _GroupLayoutState createState() => _GroupLayoutState();
}

class _GroupLayoutState extends State<GroupLayout> {
  final ChannelController channelController = Get.put(ChannelController("M08qrfFFnYQdYIL5qdEU"));
  final GroupController groupController = Get.put(GroupController("M08qrfFFnYQdYIL5qdEU"));

  @override 
  void initState() {
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
