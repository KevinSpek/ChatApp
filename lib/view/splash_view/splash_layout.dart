import 'package:flutter/material.dart';
import 'package:chatapp/responsive/responsive_layout.dart';

import 'splash_screen_mobile.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobile: SplashScreenMobile());
  }
}
