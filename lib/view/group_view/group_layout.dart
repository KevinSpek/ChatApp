import 'package:flutter/material.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/group_view/group_screen_desktop.dart';
import 'package:groupidy/view/group_view/group_screen_mobile.dart';

class GroupLayout extends StatelessWidget {
  const GroupLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: GroupScreenDesktop(
        group: dGroup,
        currChannel: pidNews,
      ),
      mobile: GroupScreenMobile(
        currChannel: pidNews,
        group: dGroup,
      ),
    );
  }
}
