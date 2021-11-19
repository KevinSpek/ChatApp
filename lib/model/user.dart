class UserGp {
  final String uid;
  String tag;
  String nickname;

  String imgPath = '';
  DateTime lastUpdated = DateTime.now();
  List<String> gids;

  UserGp({required this.uid, required this.tag, required this.nickname, this.imgPath = "", this.gids = const []});

  String getNicknameTagCombination() {
    return nickname + '#' + tag;
  }

  static UserGp fromMap(Map<String, dynamic> map) {
    return new UserGp(
      uid: map['uid'],
      tag: map['tag'],
      nickname: map['nickname'],
      imgPath: map['imgPath'],
      gids: (map['groups'].cast<String>()),
    );
  }

  static Map<String, dynamic> toMap(UserGp user) {
    return {
      'uid': user.uid,
      'tag': user.tag,
      'nickname': user.nickname,
      'imgPath': user.imgPath,
      'groups': user.gids,
    };
  }

  static UserGp empty() {
    return new UserGp(uid: '', tag: '', nickname: '');
  }
}
