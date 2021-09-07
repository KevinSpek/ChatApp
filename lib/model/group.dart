import 'package:groupidy/model/channels/channel.dart';

class Group {
  final String gid;
  final String name;
  final String tag;
  final String imgPath;
  final String ownerUid;
  DateTime lastUpdated;
  List<String> uids;
  List<String> pids;

  Group({
    required this.gid,
    required this.name,
    required this.tag,
    required this.imgPath,
    required this.ownerUid,
    required this.lastUpdated,
    required this.uids,
    required this.pids
  });
}
