class UserGp {
  final String uid;
  final String tag;
  String nickname;

  String imgPath = '';
  DateTime lastUpdated = DateTime.now();

  UserGp({
    required this.uid,
    required this.tag,
    required this.nickname,
    this.imgPath = "",
  });

  String getNicknameTagCombination() {
    return nickname + '#' + tag;
  }
}
