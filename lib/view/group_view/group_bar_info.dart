import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/view/components/bar_info.dart';

import '../../colors.dart';
import '../../typography.dart';

class GroupBarInfo extends StatefulWidget {
  const GroupBarInfo({Key? key}) : super(key: key);

  @override
  _GroupBarInfoState createState() => _GroupBarInfoState();
}

class _GroupBarInfoState extends State<GroupBarInfo> {
  GroupController groupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BarInfo(
        title: groupController.getGroupName(),
        imagePath: groupController.getGroupImgPath(),
        subTitle: '${groupController.getGroupSize()} Users',
        itemInfoClick: groupController.handleShowGroupProfile,
        rightWidget: Row(
          children: [
            Icon(Icons.person_add, color: kWhite),
            SizedBox(width: 12),
            Text('Invite Friends', style: kBodySmall.copyWith(color: kWhite)),
          ],
        )));
  }
}
