import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/user_controller.dart';

import '../../typography.dart';

class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(color: kPrimaryColor),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/LOGO.png'),
              Text(
                'Groupidy',
                style: kTitle1.copyWith(color: kWhite),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
