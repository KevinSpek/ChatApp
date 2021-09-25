import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/item_info.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

class GroupListItem extends StatelessWidget {
  GroupListItem({
    required this.group,
    required this.onTap,
    required this.notifications,
    this.latestMessage,
  });
  final Group group;
  final notifications;
  Message? latestMessage;
  Function(String) onTap;

  DateTime latestMessageTime() {
    DateTime latest = DateTime.parse("1969-07-20 20:18:04Z");
    for (NotificationMessage notification in group.notifications) {
      if (notification.time.compareTo(latest) > 0) {
        latest = notification.time;
      }
    }
    return latest;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(group.gid),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 96,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemInfo(
              imagePath: group.imgPath,
              title: group.name,
              subTitle: latestMessage == null ? '' : latestMessage!.msg,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  latestMessage == null ? '' : '${presentTime(latestMessage!.date)}',
                  style: kCaption.copyWith(color: kWhiteSecondary, fontSize: 15),
                ),
                Row(
                  children: group.notifications.map((notification) {
                    var index = group.notifications.indexOf(notification);
                    NotificationSide notificationSide = NotificationSide.none;
                    if (group.notifications.length == 1) {
                      notificationSide = NotificationSide.all;
                    } else if (index == 0) {
                      notificationSide = NotificationSide.left;
                    } else if (index == group.notifications.length - 1) {
                      notificationSide = NotificationSide.right;
                    }

                    return NotificationItem(
                      notification: notification,
                      side: notificationSide,
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
