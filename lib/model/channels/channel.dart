import 'package:groupidy/model/channels/channel_type.dart';

abstract class Channel {
  final String pid;
  final String name;
  final ChannelType type;

  String? iconText;
  String? imgPath;
  bool isImage;
  DateTime lastUpdated = DateTime.now();
  List<String>? uidsAllowed;
  List<String>? uidsAllowedToWrite;

  Channel({
    required this.pid,
    required this.name,
    required this.type,
    this.imgPath,
    this.iconText,
    this.isImage = false,
  });

  String getTypeString() {
    String? res = ChannelTypeString[type];
    return res == null ? '' : res;
  }
}
