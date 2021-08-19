import 'package:flutter/material.dart';
import 'package:groupidy/responsive/responsive_layout.dart';

import 'Join_screen_mobile.dart';


class JoinLayout extends StatelessWidget {
  const JoinLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: JoinScreenMobile(),
    );
  }
}