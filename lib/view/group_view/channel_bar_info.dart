import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/view/components/bar_info.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';

import '../../colors.dart';

class ChannelBarInfo extends StatefulWidget {
  const ChannelBarInfo({Key? key}) : super(key: key);

  @override
  _ChannelBarInfoState createState() => _ChannelBarInfoState();
}

class _ChannelBarInfoState extends State<ChannelBarInfo> {
  ChannelController channelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BarInfo(
      title: channelController.getName(),
      imagePath: channelController.getImgPath(),
      subTitle: channelTypeString[channelController.getType()],
      color: kAccentColor.withOpacity(0.8),
      useIconText: !channelController.getIsImage(),
      iconText: channelController.getIconText(),
      itemInfoClick: channelController.handleShowChannelInformation,
      rightWidget: Row(
        children: [
          CustomIconButton(icon: Icons.settings_rounded),
          SizedBox(width: 12),
          CustomIconButton(icon: Icons.search_rounded),
        ],
      ),
    ));
  }
}
