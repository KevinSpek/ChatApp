import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/item_info.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    required this.group,
    required this.onTap,
  });

  final Group group;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    String lastUpdateTime = presentTime(group.lastUpdated);

    return InkWell(
      onTap: () => onTap(group.gid),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemInfo(
              imagePath: group.imgPath,
              title: group.name,
              spacing: 16,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  lastUpdateTime,
                  style: kCaption.copyWith(color: kWhiteSecondary),
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
