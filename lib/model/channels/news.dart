import 'package:chatapp/enums/channel_types.dart';
import 'package:chatapp/model/channels/channel.dart';

class ChannelNews extends Channel {
  String cid;

  ChannelNews({
    required pid,
    required name,
    imgPath = '',
    this.cid = '',
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed,
    required uidsAllowedToWrite,
  }) : super(
          pid: pid,
          name: name,
          type: ChannelType.news,
          imgPath: imgPath,
          isImage: isImage,
          iconText: iconText,
          desc: desc,
          isLimited: isLimited,
          uidsAllowed: uidsAllowed,
          uidsAllowedToWrite: uidsAllowedToWrite,
        );

  static ChannelNews fromMap(Map<String, dynamic> map) {
    return new ChannelNews(
        pid: map['pid'], name: map['name'], imgPath: map['imgPath'], isImage: map['isImage'], isLimited: map['isLimited'], iconText: map['iconText'], desc: map['desc'], uidsAllowed: map['uidsAllowed'], uidsAllowedToWrite: map['uidsAllowedToWrite']?.cast<String>(), cid: map['cid']);
  }

  Map<String, dynamic> toMap() {
    return {'pid': pid, 'name': name, 'imgPath': imgPath, 'type': type.index, 'isImage': isImage, 'iconText': iconText, 'desc': desc, 'isLimited': isLimited, 'uidsAllowed': uidsAllowed, 'uidsAllowedToWrite': uidsAllowedToWrite, 'cid': cid};
  }
}
