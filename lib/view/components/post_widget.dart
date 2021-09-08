import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/post.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

String getPostTimeFormat(DateTime postTime) {
  Duration duration = DateTime.now().difference(postTime);
  if (duration.inDays > 0) {
    return duration.inDays.toString() + " days ago";
  } else if (duration.inHours > 0) {
    return duration.inHours.toString() + "h ago";
  } else if (duration.inMinutes > 0) {
    return duration.inMinutes.toString() + "m ago";
  }
  return "Just now";
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kPrimaryBubble),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleImage(
                size: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.chatMsg.userNickname,
                      style: kBodyRegular.copyWith(color: kWhite),
                    ),
                    Text(
                      getPostTimeFormat(widget.post.chatMsg.date),
                      style: kCaption.copyWith(color: kWhiteSecondary),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.chatMsg.msg.length > 250
                      ? widget.post.chatMsg.msg.substring(0, 250) + '...'
                      : widget.post.chatMsg.msg,
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
                Visibility(
                  child: Text(
                    "See more",
                    style: kBodyRegular.copyWith(color: kPrimaryColor),
                  ),
                  visible: widget.post.chatMsg.msg.length > 250,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        widget.post.likes.toString(),
                        style: kBodyRegular.copyWith(color: kWhite),
                      ),
                    ),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: kWhite,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        widget.post.comments.toString(),
                        style: kBodyRegular.copyWith(color: kWhite),
                      ),
                    ),
                    Icon(
                      Icons.comment_outlined,
                      color: kWhite,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
