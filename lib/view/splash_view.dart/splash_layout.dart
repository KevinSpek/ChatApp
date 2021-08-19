import 'package:flutter/material.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/splash_view.dart/splash_screen_mobile.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobile: SplashScreenMobile());
  }
}
