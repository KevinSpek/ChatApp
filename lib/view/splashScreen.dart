import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

import '../typography.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
