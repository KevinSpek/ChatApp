import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/services/storage_service.dart';
import 'package:groupidy/utils.dart';

enum Mode { content, info, add }

class GroupController extends GetxController {
  var group = Rx<Group?>(null);
  var mode = Mode.content.obs;
  var _gid = ''.obs;

  GroupController(String gid) {
    _gid.value = gid;
  }

  void loadGroup() async {
    FirestoreService.getGroup(_gid.value,
        (DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        group.value = Group.fromMap(documentSnapshot.data()!);
      }
    });
  }

  void handleUpdateImage(PlatformFile imageData) {
    if (imageData.bytes == null) return;
    if (group.value == null) return;
    StorageService.uploadFile(
            'groups/' + _gid.value + '/' + imageData.name, imageData.bytes!)
        .then((downloadUrl) {
      FirestoreService.updateGroup(_gid.value, {'imgPath': downloadUrl});
      group.value!.imgPath = downloadUrl;
      group.refresh();
    });
  }

  void changeMode(Mode mode) {
    this.mode.value = mode;
  }

  void handleShowGroupProfile() {
    mode.value = Mode.info;
  }

  void handleShowChannelInformation() {
    mode.value = Mode.content;
  }

  void handleChannelChange(Channel channel) {
    mode.value = Mode.content;
  }

  void updateGroupTag() {
    if (group.value == null) return;
    var newTag = tagGenerator();
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
  bool isGroupAdmin(String uid) => group.value?.ownerUid == uid;
}
