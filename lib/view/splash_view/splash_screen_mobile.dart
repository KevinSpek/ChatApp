import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/user_controller.dart';

import '../../typography.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({Key? key}) : super(key: key);

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
  }

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
