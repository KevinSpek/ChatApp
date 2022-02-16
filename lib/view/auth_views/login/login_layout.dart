import 'package:flutter/material.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/view/auth_views/login/Login_screen_mobile.dart';
import 'package:chatapp/view/auth_views/login/login_screen_desktop.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginScreenMobile(),
      desktop: LoginScreenDesktop(),
    );
  }
}
