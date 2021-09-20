import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/notification_message.dart';
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
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: groups.map((group) {
            var index = groups.indexOf(group);

            return Padding(
              padding: const EdgeInsets.all(kPadding / 2),
              child: Column(
                children: [
                  GroupListItem(
                    group: group,
                    notifications: [
                      NotificationMessage(
                        chatID: '123',
                        notificationType: NotificationType.chatidy,
                        numNewMessages: 5,
                        time: DateTime.now(),
                      ),
                      NotificationMessage(
                        chatID: '123',
                        notificationType: NotificationType.forum,
                        numNewMessages: 5,
                        time: DateTime.now(),
                      ),
                      NotificationMessage(
                        chatID: '123',
                        notificationType: NotificationType.news,
                        numNewMessages: 5,
                        time: DateTime.now(),
                      ),
                    ],
                    onTap: _handleGroupTap,
                  ),
                  index < groups.length - 1
                      ? Divider(
                          color: kWhiteSecondary.withOpacity(0.3),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
