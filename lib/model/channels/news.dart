import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';

import '../chat.dart';

class ChannelNews extends Channel {
  Chat chat;

  ChannelNews({
    pid,
    name,
    imgPath = '',
    required this.chat,
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
}
