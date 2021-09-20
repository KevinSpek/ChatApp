import 'package:flutter/material.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_group_chat.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/view/channel_view/group_chat_channel.dart';
import 'package:groupidy/view/channel_view/news_channel.dart';

class ChannelPresentor extends StatelessWidget {
  const ChannelPresentor({Key? key, required this.channel}) : super(key: key);
  final Channel channel;
  @override
  Widget build(BuildContext context) {
    switch (channel.type) {
      case ChannelType.news:
        return NewsChannel(news: channel as ChannelNews, uid: dUid,);     
      case ChannelType.forum:
        // TODO: Handle this case.
        break;
      case ChannelType.groupChat:
        return GroupChatChannel(groupChat: channel as ChannelGroupChat, uid: dUid);
    }

    return Container();
  }
}
