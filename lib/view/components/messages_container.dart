import 'package:flutter/material.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/message.dart';

import 'message_bubble.dart';

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({Key? key, required this.chat, required this.myUid}) : super(key: key);

  final Chat chat;
  final String myUid;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            Iterable<int>.generate(chat.messages.length)
                .map((index) {
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
        }).toList(),
      ),
    );
  }
}
