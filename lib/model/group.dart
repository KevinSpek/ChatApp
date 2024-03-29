import 'package:chatapp/model/notification_message.dart';
import 'package:chatapp/services/storage_service.dart';
import 'package:chatapp/utils.dart';

class Group {
  final String gid;
  final String name;
  String tag;
  String? imgPath;
  final String ownerUid;
  DateTime? lastUpdated;
  List<String> uids;
  List<NotificationMessage> notifications;

  Group({required this.gid, required this.name, required this.tag, this.imgPath, required this.ownerUid, this.lastUpdated, required this.uids, this.notifications = const []});

  static Group createNewGroup(String gid, String name, String ownerUid) {
    return new Group(gid: gid, name: name, tag: tagGenerator(), ownerUid: ownerUid, uids: [ownerUid]);
  }

  static Group fromMap(Map<String, dynamic> map) {
    return new Group(gid: map['gid'], name: map['name'], tag: map['tag'], imgPath: map['imgPath'], ownerUid: map['ownerUid'], lastUpdated: map['lastUpdated']?.toDate(), uids: List<String>.from(map['uids']));
  }

  static Map<String, dynamic> toMap(Group group) {
    return {
      "gid": group.gid,
      "name": group.name,
      "tag": group.tag,
      "imgPath": group.imgPath,
      "ownerUid": group.ownerUid,
      "uids": group.uids,
    };
  }

  getGroupTagCombination() {
    return name + '#' + tag;
  }

  Future<String> getImageUrl() async {
    return imgPath != null ? await StorageService.getDownloadUrl(imgPath!) : '';
  }
}
