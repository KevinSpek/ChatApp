import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/typography.dart';

class GroupAddItem extends StatelessWidget {
  const GroupAddItem({Key? key, required this.onClick}) : super(key: key);

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        color: kAccentColor,
        child: Text(
          "Add/Join group",
          style: kBodyLarge.copyWith(color: kWhite),
        ),
      ),
    );
  }
}
