import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import '../chat.dart';

class ChannelGroupChat extends Channel {
  Chat chat;

  ChannelGroupChat({
    pid, 
    name, 
    imgPath = '', 
    required this.chat,
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
}
