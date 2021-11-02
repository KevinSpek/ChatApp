import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/view/group_view/channel_bar_info.dart';

import 'channel_information.dart';
import 'channel_presentor.dart';

class ChannelLayout extends StatefulWidget {
  const ChannelLayout({Key? key}) : super(key: key);

  @override
  _ChannelLayoutState createState() => _ChannelLayoutState();
}

class _ChannelLayoutState extends State<ChannelLayout> {
  ChannelController channelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => channelController.channel.value == null
        ? Container()
        : Expanded(
            child: Column(
            children: [
              ChannelBarInfo(),
              channelController.showChannelInformation.value
                  ? ChannelInformation()
                  : ChannelPresentor(type: channelController.getType())
            ],
          )));
  }
}
