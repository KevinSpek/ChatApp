import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import '../chat.dart';

class ChannelGroupChat extends Channel {
  String cid;

  ChannelGroupChat({
    required pid, 
    required name, 
    imgPath = '', 
    this.cid = '',
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed
    })
      : super(
            pid: pid,
            name: name,
            type: ChannelType.groupChat,
            imgPath: imgPath,
            isImage: isImage,
            iconText: iconText,
            desc: desc,
            isLimited: isLimited,
            uidsAllowed: uidsAllowed,);

  static ChannelGroupChat fromMap(Map<String, dynamic> map) {
    return new ChannelGroupChat(
      pid: map['pid'],
      name: map['name'],
      imgPath: map['imgPath'],
      isImage: map['isImage'],
      isLimited: map['isLimited'],
      iconText: map['iconText'],
      desc: map['desc'],
      uidsAllowed: map['uidsAllowed'],
      cid: map['cid']
    );
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
