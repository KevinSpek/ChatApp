class User {
  final String uid;
  final String tag;
  String nickname;

  String imgPath = '';
  DateTime lastUpdated = DateTime.now();

  User({
    required this.uid,
    required this.tag,
    required this.nickname,
    this.imgPath = "",
  });
}
