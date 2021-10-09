import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';

import '../../typography.dart';

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({Key? key}) : super(key: key);

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
                Image.asset(
                  'images/LOGO.png',
                  width: 250,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Groupidy',
                    style: kTitle1.copyWith(color: kWhite),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: 300,
                    height: 48,
                    child: TextButton(
                      child: Text(
                        "Join",
                        style: kBodyLarge.copyWith(color: Colors.white),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kAccentColor)),
                      onPressed: () => {Get..toNamed('/join')},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: 300,
                    height: 48,
                    child: TextButton(
                      child: Text(
                        "Login",
                        style: kBodyLarge.copyWith(color: Colors.white60),
                      ),
                      onPressed: () => {Get..toNamed('/login')},
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(style: kBodyRegular.copyWith(color: Colors.white54), children: [
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
