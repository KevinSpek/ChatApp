import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/controller/user_controller.dart';
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
  UserController userController = Get.find();
  final TextEditingController textEditingController = TextEditingController();
  bool isNickValid = false;
  bool isStart = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(color: kSecondaryBackground),
        Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to Groupidy!",
                style: kTitle2.copyWith(color: kWhite),
              ),
              Text(
                "Before proceeding configure your profile",
                style: kBodyLarge.copyWith(color: kWhiteSecondary),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 200,
                  child: TextField(
                    maxLength: 20,
                    textAlign: TextAlign.center,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "Nickname",
                      hintStyle: kBodyRegular.copyWith(color: Colors.white30),
                    ),
                    style: kBodyRegular.copyWith(color: Colors.white),
                    onChanged: (value) {
                      if (isStart) {
                        setState(() {
                          isStart = false;
                        });
                      }

                      setState(() {
                        isNickValid = isNicknameValid(value);
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Opacity(
                  opacity: isStart
                      ? 0
                      : isNickValid
                          ? 0
                          : 1,
                  child: Text(
                    "* Nickname must start with a letter and have atleast 3 characters",
                    style: kBodySmall.copyWith(color: kError),
                  ),
                ),
              ),
              Spacer(),
              Button(
                onPressed: isNickValid
                    ? () {
                        // TODO: upload user data
                        userController.createNewUser(textEditingController.text);
                      }
                    : null,
                text: "Submit",
                width: 300,
              ),
              Spacer(),
            ],
          ),
        )
      ],
    ));
  }
}
