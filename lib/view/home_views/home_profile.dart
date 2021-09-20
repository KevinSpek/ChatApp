import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/user.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  User _currentUser = User(uid: "uid", tag: "As2U", nickname: "ntnlbar");

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _handleCopyTag(BuildContext context) {
    Clipboard.setData(
        ClipboardData(text: _currentUser.nickname + "#" + _currentUser.tag));
    _showToast(context, "User tag copied to clipboard.");
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
          children: [
            Row(
              children: [
                CircleImage(size: 160, imagePath: _currentUser.imgPath,),
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
                              _currentUser.nickname + "#" + _currentUser.tag,
                              style: kSubTitle.copyWith(color: kWhite),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _handleCopyTag(context),
                            icon: Icon(
                              Icons.copy,
                              color: kWhite,
                            ),
                          ),
                          IconButton(
                              onPressed: () => _handleTagChange(context),
                              icon: Icon(
                                Icons.refresh,
                                color: kWhite,
                              ))
                        ],
                      ),
                      Text(
                        "Share your tag with friends so they can contact you!",
                        style: kBodySmall.copyWith(color: kWhiteSecondary),
                      )
                    ],
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
