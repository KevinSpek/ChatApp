import 'package:flutter/material.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/view/home_views/groups_view/home_groups.dart';
import 'package:groupidy/view/home_views/profile_view/home_profile.dart';
import 'package:groupidy/view/home_views/settings_view/home_settings.dart';
import 'package:groupidy/view/home_views/home_type.dart';

import 'chatidy_view/home_chatidy.dart';

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
        return HomeChatidy();
      case HomeType.settings:
        // TODO: Handle this case.
        return HomeSettings();
      case HomeType.profile:
        return HomeProfile();
    }

    return Text("No widget...");
  }
}
