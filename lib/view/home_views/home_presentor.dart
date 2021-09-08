import 'package:flutter/material.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/view/home_views/home_groups.dart';
import 'package:groupidy/view/home_views/home_profile.dart';
import 'package:groupidy/view/home_views/home_type.dart';

class HomePresentor extends StatelessWidget {
  const HomePresentor({Key? key, required this.homeType}) : super(key: key);
  final HomeType homeType;
  @override
  Widget build(BuildContext context) {
    switch (homeType) {
      case HomeType.groups:
        return HomeGroups(
          groups: dGroups,
        );

      case HomeType.chatidy:
        // TODO: Handle this case.
        break;
      case HomeType.settings:
        // TODO: Handle this case.
        break;
      case HomeType.profile:
        return HomeProfile();
    }

    return Text("No widget...");
  }
}