import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/services/storage_service.dart';

class Group {
  final String gid;
  final String name;
  final String tag;
  final String? imgPath;
  final String ownerUid;
  DateTime? lastUpdated;
  List<String> uids;
  List<String> pids;
  List<NotificationMessage> notifications;

  Group(
      {required this.gid,
      required this.name,
      required this.tag,
      this.imgPath,
      required this.ownerUid,
      this.lastUpdated,
      required this.uids,
      required this.pids,
      this.notifications = const []});

  static Group createNewGroup(String gid, String name, String ownerUid) {
    return new Group(gid: gid, name: name, tag: 'test', ownerUid: ownerUid, uids: [], pids: []);
  }

  static Group fromMap(Map<String, dynamic> map) {
    return new Group(
        gid: map['gid'],
        name: map['name'],
        tag: map['tag'],
        imgPath: map['imgPath'],
        ownerUid: map['ownerUid'],
        lastUpdated: map['lastUpdated'].toDate(),
        uids: List<String>.from(map['uids']),
        pids: List<String>.from(map['pids']));
  }

  static Map<String, dynamic> toMap(Group group) {
    return {
      "gid": group.gid,
      "name": group.name,
      "tag": group.tag,
      "imgPath": group.imgPath,
      "ownerUid": group.ownerUid,
      "uids": group.uids,
      "pids": group.pids,
    };
  }

  getGroupTagCombination() {
    return name + '#' + tag;
  }

  Future<String> getImageUrl() async {
    return imgPath != null ? await StorageService.getDownloadUrl(imgPath!) : '';
  }

  Future<List<DocumentSnapshot<Channel>>> getChannels() async {
    var futures = <Future<DocumentSnapshot<Channel>>>[];
    for (var pid in pids) {
      futures.add(getChannel(pid));
    }
    return await Future.wait(futures);
  }

  Future<DocumentSnapshot<Channel>> getChannel(String pid) {
    return FirestoreService.getChannel(gid, pid);
  }
}
