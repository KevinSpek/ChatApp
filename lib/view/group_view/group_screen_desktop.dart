import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/view/group_view/group_manu.dart';

class GroupScreenDesktop extends StatelessWidget {
  const GroupScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          flex: 2,
          child: GroupMenu(
            groups: dGroups,
          ),
        ),
        Expanded(
          flex: 9,
          child: Scaffold(
              backgroundColor: kSecondaryBackground,
              body: Column(
                children: [
                  Container(
                    color: kAccentColor,
                    height: 50,
                  ),
                  Container(
                    color: kAccentColor.withOpacity(0.8),
                    height: 50,
                  ),
                  Text("HSDASDASFSDFSDF")
                ],
              )),
        ),
      ],
    ));
  }
}
