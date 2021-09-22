import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/model/post.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/item_info.dart';

class PostBubble extends StatefulWidget {
  const PostBubble({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  _PostBubbleState createState() => _PostBubbleState();
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

bool seeMore = false;

class _PostBubbleState extends State<PostBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kRadius), color: kPrimaryBubble),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemInfo(
              title: widget.post.chatMsg.userNickname,
              subTitle: getPostTimeFormat(widget.post.chatMsg.date),
              imageSize: 48,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.chatMsg.msg.length > 250 && !seeMore ? widget.post.chatMsg.msg.substring(0, 250) + '...' : widget.post.chatMsg.msg,
                    style: kBodyRegular.copyWith(color: kWhite),
                  ),
                  widget.post.chatMsg.msg.length > 250
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              seeMore = !seeMore;
                            });
                          },
                          child: Text(
                            !seeMore ? 'See more' : "See less",
                            style: kBodyRegular.copyWith(color: kPrimaryColor),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(kRadius)),
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
                  decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(kRadius)),
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
      ),
    );
  }
}
