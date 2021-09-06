import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';
import 'package:groupidy/model/notification_message.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.side,
    required this.notification,
  }) : super(key: key);
  final NotificationSide side;
  final NotificationMessage notification;

  final double notificationRadius = 5;

  Color notificationColor() {
    switch (notification.notificationType) {
      case NotificationType.news:
        return kNewsNotification;
      case NotificationType.forum:
        return kForumNotification;
      case NotificationType.groupChat:
        return kGroupchatNotification;
      case NotificationType.chatidy:
        return kChatidyNotification;
      case NotificationType.tag:
        return kTagNotification;
    }
  }

  BorderRadius radius() {
    switch (side) {
      case NotificationSide.left:
        return BorderRadius.only(bottomLeft: Radius.circular(notificationRadius), topLeft: Radius.circular(notificationRadius));

      case NotificationSide.right:
        return BorderRadius.only(bottomRight: Radius.circular(notificationRadius), topRight: Radius.circular(notificationRadius));

      case NotificationSide.none:
        return BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        );

      case NotificationSide.all:
        return BorderRadius.all(Radius.circular(notificationRadius));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 45,
      decoration: BoxDecoration(
        color: notificationColor(),
        borderRadius: radius(),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${notification.numNewMessages}',
              textAlign: TextAlign.center,
              style: kCaption.copyWith(color: kWhite),
            ), // TODO: Add number of notifications!
            Image.asset(
              'images/${notification.notificationType.toString().split('.').last}.png',
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}