class Group {
  final String gid;
  final String name;
  final String tag;
  final String imgPath;
  final String ownerUid;
  DateTime lastUpdated;
  List<String> uids;

  Group({
    required this.gid,
    required this.name,
    required this.tag,
    required this.imgPath,
    required this.ownerUid,
    required this.lastUpdated,
    required this.uids,
  });
}
