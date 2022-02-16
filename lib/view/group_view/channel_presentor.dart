import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/enums/channel_types.dart';
import 'package:chatapp/view/channel_view/forum_channel.dart';
import 'package:chatapp/view/channel_view/group_chat_channel.dart';
import 'package:chatapp/view/channel_view/news_channel.dart';

class ChannelPresentor extends StatefulWidget {
  const ChannelPresentor({Key? key, required this.type}) : super(key: key);

  final ChannelType type;

  @override
  State<ChannelPresentor> createState() => _ChannelPresentorState();
}

class _ChannelPresentorState extends State<ChannelPresentor> {
  ChannelController channelController = Get.find();

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case ChannelType.news:
        return NewsChannel();
      case ChannelType.forum:
        return ForumChannel();
      case ChannelType.groupChat:
        return GroupChatChannel();
      case ChannelType.none:
        return Container();
    }
  }
}
