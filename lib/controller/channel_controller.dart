
import 'package:get/get.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/services/firestore_service.dart';

class ChannelController extends GetxController {
  var channel = Rx<Channel?>(null);
  var _gid = '';

  ChannelController(Channel channel, String gid) {
    this.channel.value = channel;
    _gid = gid;
  }

  void handleChannelChange(Channel channel) {
    this.channel.value = channel;
  }

  Future<void> updateChannelName(String name) {
    channel.value!.name = name;
    return FirestoreService.updateChannel(_gid, channel.value!.pid, {"name": name});
  }

  Future<void> updateChannelDescription(String description) {
    channel.value!.desc = description;
    return FirestoreService.updateChannel(_gid, channel.value!.pid, {"desc": description});
  }

  Future<void> updateChannelImage(bool isImage, String iconText, String imgPath) {
    channel.value!.isImage = isImage;
    channel.value!.iconText = iconText;
    channel.value!.imgPath = imgPath;
    return FirestoreService.updateChannel(_gid, channel.value!.pid, {"isImage": isImage, "iconText": iconText, "imgPath": imgPath});
  }

  Future<void> setChannelNotLimited() {
    channel.value!.isLimited = false;
    return FirestoreService.updateChannel(_gid, channel.value!.pid, {"isLimited": false});
  }

  String getName() => channel.value?.name ?? '';
  String getDescription() => channel.value?.desc ?? '';
  ChannelType getType() => channel.value?.type ?? ChannelType.none;
  bool getIsImage() => channel.value?.isImage ?? false;
  String getIconText() => channel.value?.iconText ?? '';
  String getImgPath() => channel.value?.imgPath ?? '';
  bool getIsLimited() => channel.value?.isLimited ?? false;
  List<String> getUidsAllowed() => channel.value?.uidsAllowed ?? <String>[];
  bool isChatChannel() => channel.value?.isChatChannel() ?? false;
  String getCid() => channel.value!.getCid();
}