import 'package:flutter/material.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/auth_views/login/Login_screen_mobile.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobile: LoginScreenMobile());
  }
}
