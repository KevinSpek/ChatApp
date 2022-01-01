import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/services/storage_service.dart';

class ChannelController extends GetxController {
  var channel = Rx<Channel?>(null);
  var channels = Rx<List<Channel>>([]);
  var showChannelInformation = false.obs;
  var _gid = '';

  ChannelController(String gid) {
    _gid = gid;
  }

  void loadChannels() {
    FirestoreService.getChannels(_gid).then((query) => {
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

  Future<Channel> createChannel(String name, ChannelType type, bool isImage,
      String iconText, String imgPath, String ownerUid) {
    return FirestoreService.createChannel(_gid, name, type, isImage, iconText, imgPath, ownerUid)
        .then((channel) {
      channels.value.add(channel);
      channels.refresh();
      return channel;
    });
  }

  void handleChannelChange(Channel channel) {
    this.channel.value = channel;
    this.showChannelInformation.value = false;
  }

  void handleChannelDelete() {
    FirestoreService.deleteChannel(_gid, channel.value!.pid).then((value) {
      channels.value.removeWhere((element) => element.pid == channel.value!.pid);
      showChannelInformation.value = false;
      channel.value = null;
      channels.refresh();
    });
  }

  void handleShowChannelInformation() {
    this.showChannelInformation.value = true;
  }

  void handleHideChannelInformation() {
    this.showChannelInformation.value = false;
  }

  Future<void> updateChannelName(String name) {
    channel.value!.name = name;
    channels.value.firstWhere((c) => c.pid == channel.value!.pid).name = name;
    channels.refresh();
    channel.refresh();
    return FirestoreService.updateChannel(
        _gid, channel.value!.pid, {"name": name});
  }

  Future<void> updateChannelDescription(String description) {
    channel.value!.desc = description;
    return FirestoreService.updateChannel(
        _gid, channel.value!.pid, {"desc": description});
  }

  void updateChannelImage(bool isImage, String iconText, PlatformFile? file) {
    if (file == null || file.bytes == null) {
      channel.value!.isImage = isImage;
      channel.value!.iconText = iconText;
      channel.refresh();
      FirestoreService.updateChannel(
          _gid, channel.value!.pid, {"isImage": isImage, "iconText": iconText});
    } else {
      StorageService.uploadFile(
              'groups/' +
                  _gid +
                  '/channels/' +
                  channel.value!.pid +
                  '/' +
                  file.name,
              file.bytes!)
          .then((downloadUrl) {
        FirestoreService.updateChannel(_gid, channel.value!.pid,
            {"isImage": isImage, "iconText": iconText, 'imgPath': downloadUrl});
        channel.value!.imgPath = downloadUrl;
        channel.refresh();
      });
    }
  }

  Future<void> setChannelNotLimited() {
    channel.value!.isLimited = false;
    return FirestoreService.updateChannel(
        _gid, channel.value!.pid, {"isLimited": false});
  }

  String getName() => channel.value?.name ?? '';
  String getDescription() => channel.value?.desc ?? '';
  ChannelType getType() => channel.value?.type ?? ChannelType.none;
  bool getIsImage() => channel.value?.isImage ?? false;
  String getIconText() =>
      channel.value?.iconText ?? channel.value!.name.substring(0, 3);
  String getImgPath() => channel.value?.imgPath ?? '';
  bool getIsLimited() => channel.value?.isLimited ?? false;
  List<String> getUidsAllowed() => channel.value?.uidsAllowed ?? <String>[];
  List<String> getUidsAllowedToWrite() =>
      channel.value?.uidsAllowedToWrite ?? <String>[];
  bool isChatChannel() => channel.value?.isChatChannel() ?? false;
  String getCid() => channel.value!.getCid();
  String getPid() => channel.value?.pid ?? '';
}
