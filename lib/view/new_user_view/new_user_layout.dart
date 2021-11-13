import 'package:flutter/material.dart';
import 'package:groupidy/responsive/responsive_layout.dart';
import 'package:groupidy/view/new_user_view/new_user_mobile.dart';

class NewUserLayout extends StatefulWidget {
  const NewUserLayout({Key? key}) : super(key: key);

  @override
  _NewUserLayoutState createState() => _NewUserLayoutState();
}

class _NewUserLayoutState extends State<NewUserLayout> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: NewUserMobile(),
    );
  }
}
