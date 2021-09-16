import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/message_bubble.dart';
import 'package:groupidy/view/components/messages_container.dart';
import 'package:groupidy/view/components/textfield_bar.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

class HomeChatidy extends StatefulWidget {
  const HomeChatidy({Key? key}) : super(key: key);

  @override
  _HomeChatidyState createState() => _HomeChatidyState();
}

class _HomeChatidyState extends State<HomeChatidy> {
  List<Chat> _chats = dChats;
  String _myUid = dUid;
  int _currentChatIndex = 0;

  void _handleChatClick(int index) {
    setState(() {
      _currentChatIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryBackground,
      child: Row(
        children: [
          Expanded(
            child: SideBar(
              handleChatClick: _handleChatClick,
              chats: _chats,
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: CircleImage(
                            size: 48,
                            imagePath:
                                _chats[_currentChatIndex].userToChat.imgPath,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          _chats[_currentChatIndex].userToChat.nickname,
                          style: kBodyRegular.copyWith(color: kWhite),
                        )),
                        IconButton(
                            padding: EdgeInsets.all(16),
                            onPressed: null,
                            icon: Icon(
                              Icons.settings_rounded,
                              color: kWhite,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kSecondaryBackground,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: MessagesContainer(
                            chat: _chats[_currentChatIndex],
                            myUid: _myUid,
                          )),
                          TextFieldBar(
                            onSend: (s) => {},
                            outerPadding: 16,
                            textStyle: kBodyRegular.copyWith(color: kWhite),
                            hintStyle:
                                kBodyRegular.copyWith(color: kWhiteDisabled),
                          ),
                        ]),
                  ),
                )
              ],
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required this.handleChatClick, required this.chats})
      : super(key: key);

  final Function(int) handleChatClick;
  final List<Chat> chats;

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
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Chats",
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              )
            ],
          ),
        ),
        Column(
          children: Iterable<int>.generate(chats.length)
              .map((index) => ChatItem(
                    chat: chats[index],
                    onTap: () => handleChatClick(index),
                  ))
              .toList(),
        )
      ],
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: CircleImage(
                size: 48,
                imagePath: chat.userToChat.imgPath,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chat.userToChat.nickname,
                    style: kBodyRegular.copyWith(color: kWhite),
                  ),
                  Text(
                    chat.messages[0].msg,
                    style: kBodySmall.copyWith(color: kWhiteSecondary),
                  )
                ],
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
