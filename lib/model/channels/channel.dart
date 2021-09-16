import 'package:groupidy/model/channels/channel_type.dart';

abstract class Channel {
  final String pid;
  final String name;

  ChannelType type;
  String iconText = '';
  String imgPath = '';
  DateTime lastUpdated = DateTime.now();
  List<String>? uidsAllowed;
  List<String>? uidsAllowedToWrite;

  Channel({
    required this.pid,
    required this.name,
    required this.type,
  });
}
