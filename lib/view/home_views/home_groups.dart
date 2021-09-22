import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/create_join_group/create_join_group.dart';
import 'package:groupidy/view/home_views/group_list_item.dart';

class HomeGroups extends StatelessWidget {
  const HomeGroups({
    Key? key,
    required this.groups,
  }) : super(key: key);
  final List<Group> groups;

  void _handleGroupTap(String groupID) {
    // TODO: Save the clicked grouped in a controller
    Get.toNamed('/group');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () => dialog(context: context, child: CreateJoinGroup()),
          backgroundColor: kAccentColor,
          child: Image.asset("images/group_float.png", height: 36, width: 36),
        ),
        body: ListView.separated(
            itemCount: groups.length,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(kPadding / 2),
                child: Column(
                  children: [
                    GroupListItem(
                      group: groups[index],
                      latestMessage: dGroupMessages[index],
                      onTap: _handleGroupTap,
                    ),
                  ],
                ),
              );
            }));
  }
}
