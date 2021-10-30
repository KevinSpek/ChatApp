import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel_group_chat.dart';
import 'package:groupidy/model/channels/forum.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/view/channel_view/group_chat_channel.dart';

abstract class Channel {
  final String pid;
  final ChannelType type;
  String name;
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

  static Channel createChannel(String pid, String name, ChannelType type) {
    switch (type) {
      case ChannelType.news:
        return new ChannelNews(pid: pid, name: name, uidsAllowedToWrite: []);
      case ChannelType.groupChat:
        return new ChannelGroupChat(pid: pid, name: name, cid: FirestoreService.getCid());
      case ChannelType.forum:
        return new ChannelForum(pid: pid, name: name);
      case ChannelType.none:
        return new ChannelNews(pid: pid, name: name, uidsAllowedToWrite: []);
    }
  }

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
    switch (channel.type) {
      case ChannelType.news:
        return (channel as ChannelNews).toMap();
      case ChannelType.groupChat:
        return (channel as ChannelGroupChat).toMap();
      case ChannelType.forum:
        return (channel as ChannelForum).toMap();
      case ChannelType.none:
        return (channel as ChannelNews).toMap();
    }
  }

  bool isChatChannel() {
    return type == ChannelType.groupChat || type == ChannelType.news;
  }

  String getCid() {
    if (type == ChannelType.groupChat) {
      return (this as ChannelGroupChat).cid;
    }
    return "";
  }
}
