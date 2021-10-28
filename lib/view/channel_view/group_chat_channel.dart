import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/channel_group_chat.dart';
import 'package:groupidy/view/components/message_bubble.dart';
import 'package:groupidy/view/components/messages_container.dart';
import 'package:groupidy/view/components/textfield_bar.dart';

import '../../colors.dart';
import '../../typography.dart';

class GroupChatChannel extends StatefulWidget {
  const GroupChatChannel({Key? key, required this.groupChat, required this.uid})
      : super(key: key);
  final ChannelGroupChat groupChat;
  final String uid;
  @override
  _GroupChatChannelState createState() => _GroupChatChannelState();
}

class _GroupChatChannelState extends State<GroupChatChannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: MessagesContainer(
                chat: widget.groupChat.chat!,
                myUid: widget.uid,
              )),
              TextFieldBar(
                onSend: (s) => {},
                outerPadding: 16,
                textStyle: kBodyRegular.copyWith(color: kWhite),
                hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
              ),
            ]),
      ),
    );
  }
}
