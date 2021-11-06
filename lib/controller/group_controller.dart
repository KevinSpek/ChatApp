import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';

class GroupController extends GetxController {
  var group = Rx<Group?>(null);
  var groupImageDownloadUrl = Rx<String?>(null);
  var showGroupProfile = false.obs;
  var _gid = '';

  GroupController(String gid) {
    _gid = gid;
  }

  void loadGroup() async {
    FirestoreService.getGroup(_gid,
        (DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        group.value = Group.fromMap(documentSnapshot.data()!);
        getGroupImageUrl().then((String? imageDownloadUrl) {
          groupImageDownloadUrl.value = imageDownloadUrl;
        });
      }
    });
  }

  void handleShowGroupProfile() {
    showGroupProfile.value = true;
  }

  void handleShowChannelInformation() {
    showGroupProfile.value = false;
  }

  void handleChannelChange(Channel channel) {
    showGroupProfile.value = false;
  }

  void updateGroupTag() {
    if (group.value == null)
      return;
    var newTag = 'abc' + Random().nextInt(9).toString();
    group.value!.tag = newTag;
    group.refresh();
    FirestoreService.updateGroup(group.value!.gid, {'tag': newTag});
  }

  String getGroupName() => group.value?.name ?? "";
  int getGroupSize() => group.value?.uids.length ?? 0;
  String getGroupNameAndTag() => group.value?.getGroupTagCombination() ?? '';
  List<String> getGroupMembersUids() => group.value?.uids ?? [];
  String getGroupOwnerUid() => group.value?.ownerUid ?? "";
  Future<String?> getGroupImageUrl() async => await group.value?.getImageUrl();
}
