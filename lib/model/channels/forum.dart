import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/post.dart';

import 'channel.dart';

class ChannelForum extends Channel {
  List<Post> posts;

  ChannelForum({
    pid,
    name,
    imgPath = '',
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed,
    uidsAlloedToWrite,
    uidsAllowedToWrite = const [],
    this.posts = const [],
  }) : super(pid: pid, name: name, type: ChannelType.forum, imgPath: imgPath, isImage: isImage, iconText: iconText, desc: desc, isLimited: isLimited, uidsAllowed: uidsAllowed, uidsAllowedToWrite: uidsAlloedToWrite);

  static ChannelForum fromMap(Map<String, dynamic> map) {
    return new ChannelForum(
      pid: map['pid'],
      name: map['name'],
    );
  }
}
