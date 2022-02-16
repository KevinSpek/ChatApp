import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/model/post.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/components/item_info.dart';
import 'package:chatapp/view/components/textfield_bar.dart';

class PostBubble extends StatefulWidget {
  const PostBubble({Key? key, required this.post, required this.uid}) : super(key: key);

  final Post post;
  final String uid;

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
bool type = false;

void _handleAddComment(String commentText) {
  // Add comment
}

void _handleLike() {
  // post like
}

class _PostBubbleState extends State<PostBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kRadius), color: kSecondaryBubble),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemInfo(
              title: widget.post.chatMsg.senderNickname,
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
                            style: kBodyRegular.copyWith(color: kAccentColor),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PostButton(
                  text: widget.post.likes.toString(),
                  icon: Icons.thumb_up_alt_outlined,
                  onTap: () {
                    _handleLike();
                  },
                ),
                SizedBox(width: 8),
                PostButton(
                  text: widget.post.comments.toString(),
                  icon: Icons.comment_outlined,
                  onTap: () {
                    setState(() {
                      type = !type;
                    });
                  },
                ),
              ],
            ),
            type
                ? SizedBox(
                    height: 16,
                  )
                : SizedBox.shrink(),
            type ? TextFieldBar(onSend: ((value) => _handleAddComment(value))) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(kRadius)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                text,
                style: kBodyRegular.copyWith(color: kWhite),
              ),
            ),
            Icon(
              icon,
              color: kWhite,
            ),
          ],
        ),
      ),
    );
  }
}
