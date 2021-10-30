
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';

import '../dummy_data.dart';

class GroupController extends GetxController {
  var group = Rx<Group?>(null);
  var groupImageDownloadUrl = Rx<String?>(null);
  var channels = Rx<List<Channel>>([]);
  var showGroupProfile = false.obs;
  var showChannelInformation = false.obs;
  var currentChannel = dChannel3.obs;
  var _gid = '';

  var channelControlller = Get.find<ChannelController>();

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
        loadChannels();
      }
    });
  }

  void loadChannels() {
    if (group.value == null) return;
    FirestoreService.getChannels(group.value!.gid).then((query) => {
          query.docs.forEach((doc) {
            var channelToAdd = doc.data();
            if (!channels.value
                .any((channel) => channel.pid == channelToAdd.pid)) {
              channels.value.add(channelToAdd);
            } else {
              //update existing channel
              var channelIndex = channels.value
                  .indexWhere((channel) => channel.pid == channelToAdd.pid);
              channels.value[channelIndex] = channelToAdd;
            }
            channels.refresh();
          })
        });
  }

  void createChannel(String name, ChannelType type) {
    if (group.value != null) {
      FirestoreService.createChannel(group.value!.gid, name, type);
    }
  }

  void handleShowGroupProfile() {
    showGroupProfile.value = true;
    showChannelInformation.value = false;
  }

  void handleShowChannelInformation() {
    showGroupProfile.value = false;
    showChannelInformation.value = true;
  }

  void handleChannelChange(Channel channel) {
    currentChannel.value = channel;
    showGroupProfile.value = false;
    showChannelInformation.value = false;
    channelControlller.handleChannelChange(channel);
  }

  String getGroupName() => group.value?.name ?? "";
  int getGroupSize() => group.value?.uids.length ?? 0;
  String getGroupNameAndTag() => group.value?.getGroupTagCombination() ?? '';
  List<String> getGroupMembersUids() => group.value?.uids ?? [];
  String getGroupOwnerUid() => group.value?.ownerUid ?? "";
  Future<String?> getGroupImageUrl() async => await group.value?.getImageUrl();
}
