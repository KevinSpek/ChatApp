import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/message_bubble.dart';

class NewsChannel extends StatelessWidget {
  const NewsChannel({Key? key, required this.news, required this.uid}) : super(key: key);
  final ChannelNews news;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemCount: news.messages.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageBubble(
                        msg: news.messages[index].msg,
                        senderName: news.messages[index].userNickname,
                        sentTime: news.messages[index].date,
                        isMyMessage: uid == news.messages[index].senderID,
                      ),
                    );
                  }),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              color: Colors.white.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This is a news channel.\nOnly admins can type here.',
                  style: kBodySmall.copyWith(
                    color: kWhiteSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
