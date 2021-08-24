class Channel {
  final String pid;
  final String name;

  String iconText = '';
  String imgPath = '';
  DateTime lastUpdated = DateTime.now();
  List<String>? uidsAllowed;
  List<String>? uidsAllowedToWrite;

  Channel({
    required this.pid,
    required this.name,
  });
}
