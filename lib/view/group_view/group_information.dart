import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/components/members.dart';

import '../../colors.dart';
import '../../typography.dart';

class GroupInformation extends StatefulWidget {
  const GroupInformation({Key? key, required this.group}) : super(key: key);

  final Group group;

  @override
  _GroupInformationState createState() => _GroupInformationState();
}

class _GroupInformationState extends State<GroupInformation> {
  Group _group = dGroup;

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _handleCopyTag(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _group.name + "#" + _group.tag));
    _showToast(context, "Group tag copied to clipboard.");
  }

  void _handleTagChange(BuildContext context) {
    // Handle tag change async
    _showToast(context, "Tag changed succesfully.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryBackground,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleImage(
                  size: 160,
                  imagePath: _group.imgPath,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              _group.name + "#" + _group.tag,
                              style: kSubTitle.copyWith(color: kWhite),
                            ),
                          ),
                          CustomIconButton(
                            onPressed: () => _handleCopyTag(context),
                            icon: Icons.copy,
                          ),
                          CustomIconButton(
                            onPressed: () => _handleTagChange(context),
                            icon: Icons.refresh,
                          )
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
            Members(
              membersUids: _group.uids,
              title: 'Group members',
            )
          ],
        ),
      ),
    );
  }
}
