import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';

import '../chat.dart';

class ChannelNews extends Channel {
  Chat? chat;

  ChannelNews({
    pid,
    name,
    imgPath = '',
    this.chat,
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
            uidsAllowedToWrite: uidsAllowedToWrite,);

  static ChannelNews fromMap(Map<String, dynamic> map) {
    return new ChannelNews(
      pid: map['pid'],
      name: map['name'],
      uidsAllowedToWrite: []
    );
  }
}
