import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/components/members.dart';

import '../../colors.dart';
import '../../typography.dart';
import '../../utils.dart';

class GroupInformation extends StatefulWidget {
  const GroupInformation({Key? key}) : super(key: key);

  @override
  _GroupInformationState createState() => _GroupInformationState();
}

class _GroupInformationState extends State<GroupInformation> {
  GroupController groupController = Get.find();
  UserController userController = Get.find();

  void _handleCopyTag(BuildContext context) {
    Clipboard.setData(ClipboardData(text: groupController.getGroupNameAndTag()));
    showToast(context, "Group tag copied to clipboard.");
  }

  void _handleTagChange(BuildContext context) {
    // Handle tag change async
    groupController.updateGroupTag();
    showToast(context, "Tag changed succesfully.");
  }

  void _handleImagePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image
    );
    if (result != null) {
      groupController.handleUpdateImage(result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(() => CircleImage(
                    size: 160,
                    imagePath: groupController.getGroupImgPath(),
                    onClick: groupController.isGroupAdmin(userController.getUserUid()) ? _handleImagePick : null,
                    placeholderPath: 'images/group_placeholder.png',
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Obx(() => Text(
                                groupController.getGroupNameAndTag(),
                                style: kSubTitle.copyWith(color: kWhite),
                              )),
                            ),
                            CustomIconButton(
                              onPressed: () => _handleCopyTag(context),
                              icon: Icons.copy,
                            ),
                            groupController.isGroupAdmin(userController.getUserUid()) ? CustomIconButton(
                              onPressed: () => _handleTagChange(context),
                              icon: Icons.refresh,
                            ) : SizedBox.shrink()
                          ],
                        ),
                        SizedBox(
                          width: 360,
                          child: Text(
                            "Copy and share the tag with friends to invite them into the group",
                            style: kBodySmall.copyWith(color: kWhiteSecondary),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Divider(
                  height: 1,
                  color: kWhiteDisabled,
                ),
              ),
              Obx(() => Members(
                membersUids: groupController.getGroupMembersUids(),
                title: 'Group members',
                ownerUid: groupController.getGroupOwnerUid(),
              ))
            ],
          ),
        ),
    );
  }
}
