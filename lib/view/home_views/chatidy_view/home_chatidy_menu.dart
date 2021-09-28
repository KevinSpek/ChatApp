import 'package:flutter/material.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/components/item_info.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class ChatidyMenu extends StatelessWidget {
  const ChatidyMenu(
      {Key? key,
      required this.onChatClick,
      required this.chats,
      required this.onShowAddChat,
      required this.onAddChat,
      required this.showAddChat})
      : super(key: key);

  final Function(int) onChatClick;
  final VoidCallback onShowAddChat;
  final Function(String) onAddChat;
  final List<Chat> chats;
  final bool showAddChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: kWhiteDisabled, width: 0.5),
                  right: BorderSide(color: kWhiteDisabled, width: 0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Chats",
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              ),
              Row(children: [
                CustomIconButton(
                  icon: Icons.search_rounded,
                ),
                CustomIconButton(
                    onPressed: onShowAddChat,
                    icon:
                        showAddChat ? Icons.close_rounded : Icons.add_rounded),
              ])
            ],
          ),
        ),
        AddChat(onAddChat: onAddChat, showAddChat: showAddChat),
        Expanded(
          child: ListView(
            children: Iterable<int>.generate(chats.length)
                .map((index) => ChatItem(
                      chat: chats[index],
                      onTap: () => onChatClick(index),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class AddChat extends StatefulWidget {
  const AddChat({
    Key? key,
    required this.onAddChat,
    required this.showAddChat,
  }) : super(key: key);

  final Function(String p1) onAddChat;
  final bool showAddChat;

  @override
  _AddChatState createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {

  String _userTag = '';

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: kWhiteDisabled, width: 0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User tag',
              style: kBodySmall.copyWith(color: kWhite),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (s) {setState(() {
                      _userTag = s;
                    });},
                    style: kBodyRegular.copyWith(color: kWhite),
                    decoration: InputDecoration(
                        hintText: 'Example: name#12Yc',
                        isDense: true,
                        hintStyle:
                            kBodyRegular.copyWith(color: kWhiteSecondary)),
                  ),
                ),
                CustomIconButton(
                  icon: Icons.check_rounded,
                  onPressed: () => widget.onAddChat(_userTag),
                ),
              ],
            )
          ],
        ),
      ),
      visible: widget.showAddChat,
    );
  }
}

String getLastUpdatedFormatted(DateTime lastUpdated) {
  Duration duration = DateTime.now().difference(lastUpdated);
  if (duration.inDays >= 1) {
    return "${lastUpdated.day.toString().padLeft(2, '0')}/${lastUpdated.month.toString().padLeft(2, '0')}";
  }
  return "${lastUpdated.hour.toString().padLeft(2, '0')}:${lastUpdated.minute.toString().padLeft(2, '0')}";
}

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key, required this.chat, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: kWhiteDisabled, width: 0.5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ItemInfo(
                title: chat.userToChat.nickname,
                imageSize: 48,
                imagePath: chat.userToChat.imgPath,
                subTitle: chat.messages[0].msg,
                titleStyle: kBodyRegular.copyWith(color: kWhite),
                subTitleStyle: kBodySmall.copyWith(color: kWhiteSecondary),
                spacing: 8,
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getLastUpdatedFormatted(chat.lastUpdated),
                    style:
                        kCaption.copyWith(color: kWhiteSecondary, fontSize: 15),
                  ),
                  NotificationItem(
                    side: NotificationSide.all,
                    notification: NotificationMessage(
                        chatID: "dd",
                        numNewMessages: 5,
                        notificationType: NotificationType.chatidy,
                        time: DateTime.now()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
