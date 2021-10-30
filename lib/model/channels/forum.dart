import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/post.dart';

import 'channel.dart';

class ChannelForum extends Channel {
  List<Post> posts;

  ChannelForum({
    required pid,
    required name,
    imgPath = '',
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed,
    uidsAllowedToWrite = const <String>[],
    this.posts = const [],
  }) : super(pid: pid, name: name, type: ChannelType.forum, imgPath: imgPath, isImage: isImage, iconText: iconText, desc: desc, isLimited: isLimited, uidsAllowed: uidsAllowed, uidsAllowedToWrite: uidsAllowedToWrite);

  static ChannelForum fromMap(Map<String, dynamic> map) {
    return new ChannelForum(
      pid: map['pid'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pid': pid,
      'name': name,
      'imgPath': imgPath,
      'type': type.index,
      'isImage': isImage,
      'iconText': iconText,
      'desc': desc,
      'isLimited': isLimited,
      'uidsAllowed': uidsAllowed,
      'uidsAllowedToWrite': uidsAllowedToWrite,
    };
  }
}
