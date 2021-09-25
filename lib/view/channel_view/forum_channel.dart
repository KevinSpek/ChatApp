import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/forum.dart';
import 'package:groupidy/view/components/post_bubble.dart';

class ForumChannel extends StatelessWidget {
  const ForumChannel({Key? key, required this.forum, required this.uid}) : super(key: key);
  final ChannelForum forum;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.separated(
            itemCount: forum.posts.length,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: PostBubble(
                  post: forum.posts[index],
                  uid: uid,
                ),
              );
            }),
      ),
    );
  }
}
