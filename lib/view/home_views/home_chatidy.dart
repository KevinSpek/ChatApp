import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/notification_views/notification_item.dart';
import 'package:groupidy/view/notification_views/notification_side.dart';

class HomeChatidy extends StatefulWidget {
  const HomeChatidy({Key? key}) : super(key: key);

  @override
  _HomeChatidyState createState() => _HomeChatidyState();
}

class _HomeChatidyState extends State<HomeChatidy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryBackground,
      child: Row(
        children: [
          Expanded(
            child: SideBar(),
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
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "Username",
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
  const SideBar({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Chats",
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              )
            ],
          ),
        ),
        ChatItem(chat: dChat),
        ChatItem(chat: dChat),
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
  const ChatItem({Key? key, required this.chat}) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
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
                    style: kBodySmall.copyWith(color: kWhite),
                  ),
                  NotificationItem(
                      side: NotificationSide.all,
                      notification: NotificationMessage(
                          chatID: "dd",
                          numNewMessages: 5,
                          notificationType: NotificationType.chatidy,
                          time: DateTime.now()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
