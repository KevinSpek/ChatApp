import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/user.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/button.dart';

class NewUserMobile extends StatefulWidget {
  const NewUserMobile({Key? key}) : super(key: key);

  @override
  State<NewUserMobile> createState() => _NewUserMobileState();
}

class _NewUserMobileState extends State<NewUserMobile> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    bool isNickValid = false;
    bool isStart = true;
    return Scaffold(
        body: Stack(
      children: [
        Container(color: kSecondaryBackground),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Groupidy!",
              style: kTitle2.copyWith(color: kWhite),
            ),
            Text(
              "Before proceeding configure your profile",
              style: kTitle3.copyWith(color: kWhiteSecondary),
            ),
            Container(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "Nickname"),
                onChanged: (value) {
                  if (isStart) {
                    isStart = false;
                  }
                  isNickValid = isNicknameValid(value);
                },
              ),
            ),
            Opacity(
              opacity: isNickValid ? 0 : 1,
              child: Text(
                "* Nickname must start with a letter and have atleast 4 characters",
                style: kBodySmall.copyWith(color: kError),
              ),
            ),
            Button(
              onPressed: isNickValid
                  ? () {
                      // TODO: upload user data
                      String tag = tagGenerator();
                      UserGp newUser = UserGp(nickname: textEditingController.text, tag: tag, uid: '');
                      
                    }
                  : null,
              text: "Submit",
            ),
          ],
        )
      ],
    ));
  }
}
