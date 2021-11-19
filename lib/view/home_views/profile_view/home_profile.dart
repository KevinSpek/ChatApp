import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/user.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  UserController userController = Get.find();

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _handleCopyTag(BuildContext context) {
    Clipboard.setData(ClipboardData(text: userController.user.value!.nickname + "#" + userController.user.value!.tag));
    _showToast(context, "User tag copied to clipboard.");
  }

  void _handleTagChange(BuildContext context) {
    // Handle tag change async
    userController.updateProfileTag();
    _showToast(context, "Tag changed succesfully.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryBackground,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                Obx(
                  () => CircleImage(
                    size: 160,
                    imagePath: userController.user.value!.imgPath,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Obx(
                                () => Text(
                                  userController.user.value!.nickname + "#" + userController.user.value!.tag,
                                  style: kSubTitle.copyWith(color: kWhite),
                                ),
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
                        Text(
                          "Share your tag with friends so they can contact you!",
                          style: kBodySmall.copyWith(color: kWhiteSecondary),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
