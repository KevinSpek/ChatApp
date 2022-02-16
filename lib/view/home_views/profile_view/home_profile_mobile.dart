import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/model/user.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/components/circle_image.dart';
import 'package:chatapp/view/components/custom_icon_button.dart';

import '../../../utils.dart';

class HomeProfileMobile extends StatelessWidget {
  const HomeProfileMobile({Key? key, required this.user}) : super(key: key);

  final UserGp user;

  void handleCopyTag(BuildContext context) {
    Clipboard.setData(ClipboardData(text: user.getNicknameTagCombination()));
    showToast(context, "User tag copied to clipboard.");
  }

  void handleTagChange(BuildContext context) {
    // Handle tag change async
    showToast(context, "Tag changed succesfully.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryBackground,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            CircleImage(
              size: 160,
              imagePath: user.imgPath,
            ),
            SizedBox(
              height: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        user.getNicknameTagCombination(),
                        style: kSubTitle.copyWith(color: kWhite),
                      ),
                    ),
                    CustomIconButton(
                      onPressed: () => handleCopyTag(context),
                      icon: Icons.copy,
                    ),
                    CustomIconButton(
                      onPressed: () => handleTagChange(context),
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
          ],
        ),
      ),
    );
  }
}
