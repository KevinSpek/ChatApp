import 'package:flutter/material.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/view/welcome_view/welcome_screen_mobile.dart';

class WelcomeLayout extends StatelessWidget {
  const WelcomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: WelcomeScreenMobile(),
    );
  }
}
