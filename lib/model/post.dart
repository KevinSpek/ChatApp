import 'package:groupidy/model/message.dart';

class Post {
  final Message chatMsg;
  final int comments;
  final int likes;

  Post({
    required this.chatMsg,
    this.comments = 0,
    this.likes = 0,
  });
}
