import 'package:groupidy/enums/channel_types.dart';

import 'channel.dart';

class ChannelForum extends Channel {
  String cid;

  ChannelForum({
    required pid,
    required name,
    this.cid = '',
    imgPath = '',
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed,
  }) : super(
            pid: pid,
            name: name,
            type: ChannelType.forum,
            imgPath: imgPath,
            isImage: isImage,
            iconText: iconText,
            desc: desc,
            isLimited: isLimited,
            uidsAllowed: uidsAllowed);

  static ChannelForum fromMap(Map<String, dynamic> map) {
    return new ChannelForum(
        pid: map['pid'],
        name: map['name'],
        imgPath: map['imgPath'],
        isImage: map['isImage'],
        iconText: map['iconText'],
        desc: map['desc'],
        isLimited: map['isLimited'],
        uidsAllowed: map['uidsAllowed'],
        cid: map['cid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'pid': pid,
      'name': name,
      'imgPath': imgPath,
      'type': type.index,
      'isImage': isImage,
      'iconText': iconText,
      'desc': desc,
      'isLimited': isLimited,
      'uidsAllowed': uidsAllowed,
      'cid': cid
    };
  }
}
