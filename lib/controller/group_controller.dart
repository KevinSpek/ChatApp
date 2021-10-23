import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';

class GroupController extends GetxController {
  var group = Rx<Group?>(null);
  var groupImageDownloadUrl = Rx<String?>(null);
  var channels = Rx<List<Channel>>([]);

  loadGroup(String gid) {
    FirestoreService.getGroup(gid, (DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        group.value = Group.fromMap(documentSnapshot.data()!);
        getGroupImageUrl()
          .then((String? imageDownloadUrl) {
            groupImageDownloadUrl.value = imageDownloadUrl;
          });
        group.value?.getChannels()
          .then((value) {
            value.forEach((element) { 
              channels.value.add(element.data()!);
            });
          });
      }
    });
  }

  String getGroupName() => group.value?.name ?? "";
  int getGroupSize() => group.value?.uids.length ?? 0;
  String getGroupNameAndTag() => group.value?.getGroupTagCombination() ?? '';
  List<String> getGroupMembersUids() => group.value?.uids ?? [];
  String getGroupOwnerUid() => group.value?.ownerUid ?? "";
  Future<String?> getGroupImageUrl() async => await group.value?.getImageUrl();
}
