import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/item_image.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

class GroupListItem extends StatelessWidget {
  GroupListItem({
    required this.group,
    required this.notifications,
    required this.onTap,
  });
  final Group group;
  List<NotificationMessage> notifications;
  Function(String) onTap;

  DateTime latestMessageTime() {
    DateTime latest = DateTime.parse("1969-07-20 20:18:04Z");
    for (NotificationMessage notification in notifications) {
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
            ItemImage(),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(group.name, style: kBodyRegular.copyWith(color: kWhite)),
                Text(
                  'Latest message',
                  style: kBodySmall.copyWith(color: kWhiteSecondary),
                ), // TODO: Add last message!
                Spacer()
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${presentTime(latestMessageTime())}',
                  style: kCaption.copyWith(color: kWhiteSecondary, fontSize: 15),
                ),
                Row(
                  children: notifications.map((notification) {
                    var index = notifications.indexOf(notification);
                    NotificationSide notificationSide = NotificationSide.none;
                    if (notifications.length == 1) {
                      notificationSide = NotificationSide.all;
                    } else if (index == 0) {
                      notificationSide = NotificationSide.left;
                    } else if (index == notifications.length - 1) {
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
