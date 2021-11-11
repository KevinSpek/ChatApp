import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/services/storage_service.dart';

class GroupController extends GetxController {
  var group = Rx<Group?>(null);
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
      }
    });
  }

  void handleUpdateImage(PlatformFile imageData) {
    if (imageData.bytes == null) return;
    if (group.value == null) return;
    StorageService.uploadFile('groups/' + _gid + '/' + imageData.name, imageData.bytes!)
      .then((downloadUrl) {
        FirestoreService.updateGroup(_gid, {'imgPath': downloadUrl});
        group.value!.imgPath = downloadUrl;
        group.refresh();
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
  String getGroupImgPath() => group.value?.imgPath ?? "";
}
