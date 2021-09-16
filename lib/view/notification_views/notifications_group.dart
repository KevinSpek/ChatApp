import 'package:flutter/material.dart';
import 'package:groupidy/model/notification_message.dart';

import 'notification_item.dart';
import 'notification_side.dart';

class NotificationsGroup extends StatelessWidget {
  const NotificationsGroup({Key? key, required this.notifications}) : super(key: key);

  final List<NotificationMessage> notifications;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
