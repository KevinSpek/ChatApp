import 'package:flutter/material.dart';
import 'package:chatapp/model/channels/channel.dart';
import 'package:chatapp/model/notification_message.dart';
import 'package:chatapp/view/components/item_info.dart';
import 'package:chatapp/view/notification_views/notifications_group.dart';

import '../../colors.dart';
import '../../typography.dart';

class ChannelListItem extends StatelessWidget {
  const ChannelListItem({Key? key, required this.channel, required this.notifications, this.onTap}) : super(key: key);

  final Channel channel;
  final List<NotificationMessage> notifications;
  final VoidCallback? onTap;

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
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 96,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemInfo(
              title: channel.name,
              /* subTitle: "Latest message", */
              imagePath: channel.imgPath,
              imageSize: 64,
              spacing: 20,
              titleStyle: kBodyRegular.copyWith(color: kWhite),
              subTitleStyle: kBodySmall.copyWith(color: kWhiteSecondary),
              useText: !channel.isImage,
              text: channel.iconText,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /* Text(
                  '${presentTime(latestMessageTime())}',
                  style: kCaption.copyWith(color: kWhiteSecondary),
                ), */
                NotificationsGroup(
                  notifications: notifications,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
