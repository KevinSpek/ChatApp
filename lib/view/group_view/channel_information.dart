import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/enums/channel_types.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/utils.dart';
import 'package:chatapp/view/components/button.dart';
import 'package:chatapp/view/components/circle_image.dart';
import 'package:chatapp/view/components/custom_editable_text.dart';
import 'package:chatapp/view/components/members.dart';
import 'package:chatapp/view/group_view/channel_image_change.dart';

class ChannelInformation extends StatefulWidget {
  const ChannelInformation({Key? key}) : super(key: key);

  @override
  _ChannelInformationState createState() => _ChannelInformationState();
}

class _ChannelInformationState extends State<ChannelInformation> {
  var channelController = Get.find<ChannelController>();
  var groupController = Get.find<GroupController>();
  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Obx(() => CircleImage(
                      size: 120,
                      imagePath: channelController.getImgPath(),
                      useText: !channelController.getIsImage(),
                      text: channelController.getIconText(),
                      padding: EdgeInsets.only(right: 32, bottom: 32),
                      onClick: groupController.isGroupAdmin(userController.getUserUid()) ? () => dialog(context: context, child: ChannelImageChange()) : null,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => CustomEditableText(
                          initialText: channelController.getName(),
                          textStyle: kSubTitle.copyWith(color: kWhite),
                          onTextChange: channelController.updateChannelName,
                          maxLines: 1,
                          editable: groupController.isGroupAdmin(userController.getUserUid()),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Obx(() => Text(
                            channelTypeString[channelController.getType()]!,
                            style: kBodyRegular.copyWith(color: kWhiteSecondary),
                          )),
                    )
                  ],
                )
              ],
            ),
            Obx(() => CustomEditableText(
                  hint: "Insert channel description",
                  onTextChange: (s) => channelController.updateChannelDescription(s),
                  initialText: channelController.getDescription(),
                  editable: groupController.isGroupAdmin(userController.getUserUid()),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Divider(
                height: 0.5,
                color: kWhiteDisabled,
              ),
            ),
            Obx(() => channelController.getIsLimited()
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'This channel is Limited.',
                          style: kBodyRegular.copyWith(color: kWhiteSecondary),
                        ),
                      ),
                      Members(
                        membersUids: channelController.getUidsAllowed(),
                        title: 'Channel members',
                      ),
                      Button(
                        onPressed: channelController.setChannelNotLimited(),
                        text: 'Transform to normal channel',
                        width: 350,
                        margin: EdgeInsets.only(top: 32),
                      ),
                      Text(
                        'This will make the channel accesible for all group memebers',
                        style: kBodyRegular.copyWith(color: kWhiteSecondary),
                      ),
                    ],
                  )
                : Text(
                    "This channel is Normal, Everyone in the group can enter it.",
                    style: kBodySmall.copyWith(color: kWhiteSecondary),
                  )),
            Button(
              onPressed: channelController.handleChannelDelete,
              text: "Delete Channel",
              width: 240,
              margin: EdgeInsets.only(top: 32),
            )
          ],
        ),
      ),
    );
  }
}
