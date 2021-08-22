class Channel {
  final String pid;
  final String name;
  final String imgPath;
  final String? iconText;
  DateTime lastUpdated = DateTime.now();
  List<String>? uidsAllowed;
  List<String>? uidsAllowedToWrite;

  Channel({
    this.pid,
    this.name,
    this.imgPath,
    this.iconText,
  });
}
