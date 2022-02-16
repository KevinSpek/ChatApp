import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/typography.dart';
import 'settings_items/settings_toggle.dart';

class HomeSettings extends StatelessWidget {
  HomeSettings({Key? key}) : super(key: key);
  final widthRatio = 0.7;
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryBackground,
      body: Container(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: constraints.maxWidth * widthRatio,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadius),
                    color: kSecondaryBubble,
                  ),
                  child: Column(
                    children: [
                      SettingsToggle(title: 'Dark Mode', onChange: null), //(value) {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: constraints.maxWidth * widthRatio,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kSecondaryBubble),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kRadius),
                        ),
                      ),
                    ),
                    onPressed: () {
                      userController.signOut();
                    },
                    child: Text(
                      'LOGOUT',
                      style: kBodyRegular.copyWith(color: kError, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]);
            })),
      ),
    );
  }
}
