import 'package:flutter/material.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/message.dart';

import 'message_bubble.dart';

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({Key? key, required this.chat, required this.myUid, required this.scrollController})
      : super(key: key);

  final Chat chat;
  final String myUid;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        reverse: true,
        itemCount: chat.messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = chat.messages[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: MessageBubble(
              msg: message.msg,
              senderName: message.senderNickname,
              sentTime: message.date,
              isMyMessage: myUid == message.senderUid,
            ),
          );
        });
  }
}
