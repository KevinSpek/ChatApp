import 'package:chatapp/enums/channel_types.dart';
import 'package:chatapp/model/channels/channel_group_chat.dart';
import 'package:chatapp/model/channels/forum.dart';
import 'package:chatapp/model/channels/news.dart';
import 'package:chatapp/services/firestore_service.dart';

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

  static Channel createChannel(String pid, String name, ChannelType type, bool isImage, String iconText, String imgPath, String ownerUid) {
    switch (type) {
      case ChannelType.news:
        return new ChannelNews(pid: pid, name: name, uidsAllowedToWrite: <String>[ownerUid], cid: FirestoreService.getCid(), isImage: isImage, iconText: iconText, imgPath: imgPath);
      case ChannelType.groupChat:
        return new ChannelGroupChat(pid: pid, name: name, cid: FirestoreService.getCid(), isImage: isImage, iconText: iconText, imgPath: imgPath);
      case ChannelType.forum:
        return new ChannelForum(pid: pid, name: name, cid: FirestoreService.getCid(), isImage: isImage, iconText: iconText, imgPath: imgPath);
      case ChannelType.none:
        return new ChannelNews(pid: pid, name: name, uidsAllowedToWrite: []);
    }
  }

  static Channel fromMap(Map<String, dynamic> map) {
    switch (map['type']) {
      case 1:
        return ChannelNews.fromMap(map);
      case 2:
        return ChannelGroupChat.fromMap(map);
      case 3:
        return ChannelForum.fromMap(map);
      default:
        return ChannelGroupChat.fromMap(map);
    }
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
    return type == ChannelType.groupChat || type == ChannelType.news || type == ChannelType.forum;
  }

  String getCid() {
    if (type == ChannelType.groupChat) {
      return (this as ChannelGroupChat).cid;
    } else if (type == ChannelType.news) {
      return (this as ChannelNews).cid;
    } else if (type == ChannelType.forum) {
      return (this as ChannelForum).cid;
    }
    return "";
  }
}
