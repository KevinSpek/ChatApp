import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/home_views/group_list_item.dart';

class GroupMenu extends StatelessWidget {
  const GroupMenu({
    Key? key,
    required this.groups,
  }) : super(key: key);
  final List<Group> groups;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, color: kWhite),
                SizedBox(width: 12),
                Text(
                  'Groupidy',
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              ],
            ),
            SizedBox(height: 36),
            Row(
              children: [
                Text(
                  'Channels',
                  style: kBodySmall.copyWith(color: kWhite),
                ),
                Spacer(),
                Icon(Icons.search, color: kWhite),
                Icon(Icons.add, color: kWhite),
              ],
            ),
            Divider(
              color: kWhiteSecondary.withOpacity(0.5),
            ),
            Column(
                children: groups
                    .map((group) => GroupListItem(group: group, notifications: [
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
                        ]))
                    .toList())
          ],
        ),
      ),
    );
  }
}
