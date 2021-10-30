import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/bar_info.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/group_view/channel_information.dart';
import 'package:groupidy/view/group_view/group_menu.dart';

import 'channel_presentor.dart';
import 'group_information.dart';

class GroupScreenDesktop extends StatefulWidget {
  const GroupScreenDesktop({
    Key? key,
    required this.group,
    required this.currChannel,
  }) : super(key: key);

  final Group group;
  final Channel currChannel;

  @override
  _GroupScreenDesktopState createState() => _GroupScreenDesktopState();
}

class _GroupScreenDesktopState extends State<GroupScreenDesktop> {
  GroupController groupController = Get.find();

  final double menuWidth = 332;

  @override
  Widget build(BuildContext context) {
    final bool noText = MediaQuery.of(context).size.width < 1200;
    final double menuWidth = noText ? 80 : 332;
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: menuWidth,
          child: GroupMenu(
            noText: noText,
          ),
        ),
        Container(
          color: kSecondaryBackground,
          width: MediaQuery.of(context).size.width - menuWidth,
          child: Column(
            children: [
              Obx(() => BarInfo(
                  title: groupController.getGroupName(),
                  imagePath: groupController.groupImageDownloadUrl.value,
                  subTitle: '${groupController.getGroupSize()} Users',
                  itemInfoClick: groupController.handleShowGroupProfile,
                  rightWidget: Row(
                    children: [
                      Icon(Icons.person_add, color: kWhite),
                      SizedBox(width: 12),
                      Text('Invite Friends',
                          style: kBodySmall.copyWith(color: kWhite)),
                    ],
                  ))),
              Obx(() => groupController.showGroupProfile.value
                  ? GroupInformation(group: widget.group)
                  : BarInfo(
                      title: groupController.currentChannel.value.name,
                      imagePath: groupController.currentChannel.value.imgPath,
                      subTitle: channelTypeString[groupController.currentChannel.value.type],
                      color: kAccentColor.withOpacity(0.8),
                      useIconText: !groupController.currentChannel.value.isImage,
                      iconText: groupController.currentChannel.value.iconText,
                      itemInfoClick:  groupController.handleShowChannelInformation,
                      rightWidget: Row(
                        children: [
                          CustomIconButton(icon: Icons.settings_rounded),
                          SizedBox(width: 12),
                          CustomIconButton(icon: Icons.search_rounded),
                        ],
                      ),
                    )),
              Obx(() => Visibility(
                child: groupController.showChannelInformation.value
                    ? ChannelInformation()
                    : ChannelPresentor(channel: groupController.currentChannel.value),
                visible: !groupController.showGroupProfile.value,
              )),
            ],
          ),
        ),
      ],
    ));
  }
}
