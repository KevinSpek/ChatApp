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

  static UserGp fromMap(Map<String, dynamic> map) {
    return new UserGp(uid: map['uid'], tag: map['tag'], nickname: map['nickname'], imgPath: map['imgPath']);
  }

  static Map<String, dynamic> toMap(UserGp user) {
    return {
      'uid': user.uid,
      'tag': user.tag,
      'nickname': user.nickname,
      'imgPath': user.imgPath,
    };
  }

  static UserGp empty() {
    return new UserGp(uid: '', tag: '', nickname: '');
  }
}
