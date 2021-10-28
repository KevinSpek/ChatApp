import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/messages_container.dart';
import 'package:groupidy/view/components/textfield_bar.dart';

class NewsChannel extends StatelessWidget {
  const NewsChannel({Key? key, required this.news, required this.uid})
      : super(key: key);
  final ChannelNews news;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Expanded(
                child: MessagesContainer(
              chat: news.chat!,
              myUid: uid,
            )),
            news.uidsAllowedToWrite!.contains(uid)
                ? TextFieldBar(
                    onSend: (s) => {},
                    outerPadding: 16,
                    textStyle: kBodyRegular.copyWith(color: kWhite),
                    hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                  )
                : Container(
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
