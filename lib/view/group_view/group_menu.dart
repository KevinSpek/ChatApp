import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/group_view/channel_list_item.dart';

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
      _channels = widget.pids
          .map((pid) => dChannels.firstWhere((channel) => channel.pid == pid))
          .toList();
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
      child: Column(
        children: [
          Row(
            children: [
              CustomIconButton(
                icon: Icons.arrow_back_rounded,
                onPressed: _handleReturnHome,
              ),
              SizedBox(width: 12),
              Text(
                'Groupidy',
                style: kBodyRegular.copyWith(color: kWhite),
              ),
            ],
          ),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Channels',
                  style: kBodySmall.copyWith(color: kWhite),
                ),
                Spacer(),
                CustomIconButton(icon: Icons.search_rounded),
                CustomIconButton(icon: Icons.add_rounded),
              ],
            ),
          ),
          Divider(
            color: kWhiteSecondary.withOpacity(0.5),
            height: 2,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _channels.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                Channel channel = _channels[index];
                return ChannelListItem(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
