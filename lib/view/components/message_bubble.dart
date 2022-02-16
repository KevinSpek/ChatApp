import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/typography.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.msg,
    required this.senderName,
    required this.sentTime,
    this.maxWidth = 400,
    this.isMyMessage = false,
  }) : super(key: key);

  final String msg;
  final String senderName;
  final DateTime sentTime;
  final double maxWidth;
  final bool isMyMessage;

  String getFormattedSentTime(DateTime sentTime) {
    return "${sentTime.hour.toString().padLeft(2, '0')}:${sentTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  isMyMessage ? '' : senderName,
                  style: kBodySmall.copyWith(color: kWhiteSecondary),
                ),
              ),
              Text(
                getFormattedSentTime(sentTime),
                style: kBodySmall.copyWith(color: kWhiteSecondary, fontSize: 10),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Text(
              msg,
              style: kBodyRegular.copyWith(color: kWhite),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: isMyMessage ? kPrimaryBubble : kSecondaryBubble,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(isMyMessage ? 8 : 0),
                bottomRight: Radius.circular(isMyMessage ? 0 : 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
