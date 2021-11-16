import 'package:flutter/material.dart';
//import 'package:groupidy/model/channels/forum.dart';
//import 'package:groupidy/view/components/post_bubble.dart';

class ForumChannel extends StatefulWidget {
  const ForumChannel({Key? key}) : super(key: key);

  @override
  State<ForumChannel> createState() => _ForumChannelState();
}

class _ForumChannelState extends State<ForumChannel> {
  @override
  Widget build(BuildContext context) {
    print("here");
    return Container(
      /* child: Expanded(
        child: ListView.separated(
            itemCount: 0,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: PostBubble(
                  post: ,
                  uid: '',
                ),
              );
            }),
      ), */
    );
  }
}
