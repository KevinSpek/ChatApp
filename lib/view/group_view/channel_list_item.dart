import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/item_info.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';
import 'package:groupidy/view/notification_views/notifications_group.dart';

import '../../colors.dart';
import '../../typography.dart';
import '../../utils.dart';

class ChannelListItem extends StatelessWidget {
  const ChannelListItem(
      {Key? key,
      required this.channel,
      required this.notifications,
      this.onTap})
      : super(key: key);

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
        height: 96,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemInfo(
              title: channel.name,
              subTitle: "Latest message",
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
                Text(
                  '${presentTime(latestMessageTime())}',
                  style: kCaption.copyWith(color: kWhiteSecondary),
                ),
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
