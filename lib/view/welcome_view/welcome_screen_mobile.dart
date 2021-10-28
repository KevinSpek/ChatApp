import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/routes/app_pages.dart';
import 'package:groupidy/view/components/button.dart';

import '../../typography.dart';

class WelcomeScreenMobile extends StatelessWidget {
  WelcomeScreenMobile({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'images/LOGO.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Groupidy',
                    style: kTitle2.copyWith(color: kWhite),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Button(
                      width: 300,
                      onPressed: () => {
                            Get..toNamed(Routes.LOGIN),
                          },
                      text: "Enter App"),
                ),
                SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(style: kBodySmall.copyWith(color: Colors.white54), children: [
                          TextSpan(text: "By joining you agree to our\n"),
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: Color(0xff0085FF),
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => {},
                          ),
                          TextSpan(text: " and\n"),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Color(0xff0085FF),
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => {},
                          ),
                        ])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
