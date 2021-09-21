import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/group_view/channel_list_item.dart';
import 'package:groupidy/view/home_views/group_list_item.dart';

class GroupMenu extends StatefulWidget {
  const GroupMenu({
    Key? key,
    required this.pids,
    required this.onChannelChange,
  }) : super(key: key);

  final List<String> pids;
  final Function(Channel) onChannelChange;

  @override
  _GroupMenuState createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  List<Channel> _channels = [];

  @override
  void initState() {
    setState(() {
      _channels = widget.pids.map((pid) => dChannels.firstWhere((channel) => channel.pid == pid)).toList();
    });
    super.initState();
  }

  void _handleReturnHome() {
    // TODO: manage controller accordingly
    Get.toNamed('/home');
  }

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
                InkWell(
                  child: Icon(Icons.arrow_back, color: kWhite),
                  onTap: _handleReturnHome,
                ),
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
                children: _channels
                    .map((channel) => ChannelListItem(
                          channel: channel,
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
                          onTap: () => widget.onChannelChange(channel),
                        ))
                    .toList())
          ],
        ),
      ),
    );
  }
}
