import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel_group_chat.dart';
import 'package:groupidy/model/channels/forum.dart';

abstract class Channel {
  final String pid;
  final String name;
  final ChannelType type;

  String? desc;
  String? iconText;
  String? imgPath;
  bool isImage;
  DateTime lastUpdated = DateTime.now();
  List<String>? uidsAllowed;
  List<String>? uidsAllowedToWrite;
  bool isLimited;

  Channel({
    required this.pid,
    required this.name,
    required this.type,
    this.imgPath,
    this.iconText,
    this.isImage = false,
    this.isLimited = false,
    this.desc,
    this.uidsAllowed,
    this.uidsAllowedToWrite,
  });

  static Channel fromMap(Map<String, dynamic> map) {
    switch (map['type']) {
      case ChannelType.news:
        return ChannelForum.fromMap(map);
      case ChannelType.groupChat:
        return ChannelGroupChat.fromMap(map);
      case ChannelType.forum:
        return ChannelForum.fromMap(map);
    }
    return ChannelGroupChat.fromMap(map);
  }

  static Map<String, dynamic> toMap(Channel channel) {
    return {

    };
  }
}
