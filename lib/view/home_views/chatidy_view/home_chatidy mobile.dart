import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

import 'home_chatidy_menu.dart';

class HomeChatidyMobile extends StatelessWidget {
  const HomeChatidyMobile({ Key? key, required this.chats }) : super(key: key);

  final chats;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryBackground,
        child: ListView(
          children: Iterable<int>.generate(chats.length)
              .map((index) => ChatItem(
                    chat: chats[index],
                    onTap: () => {},
                  ))
              .toList(),
        ));
  }
}
