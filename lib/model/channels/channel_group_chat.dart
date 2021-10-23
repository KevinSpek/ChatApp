import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import '../chat.dart';

class ChannelGroupChat extends Channel {
  Chat? chat;

  ChannelGroupChat({
    pid, 
    name, 
    imgPath = '', 
    this.chat,
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
    );
  }
}
