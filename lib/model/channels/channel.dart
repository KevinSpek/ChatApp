import 'package:groupidy/model/channels/channel_type.dart';

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

  String getTypeString() {
    String? res = ChannelTypeString[type];
    return res == null ? '' : res;
  }
}
