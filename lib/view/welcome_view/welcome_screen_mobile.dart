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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: kPrimaryColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/LOGO.png'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Groupidy',
                  style: kTitle1.copyWith(color: kWhite),
                ),
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
              RichText(
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
                  ]))
            ],
          )
        ],
      ),
    );
  }
}
