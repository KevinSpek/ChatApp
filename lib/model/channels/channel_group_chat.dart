import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';
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
    })
      : super(
            pid: pid,
            name: name,
            type: ChannelType.groupChat,
            imgPath: imgPath,
            isImage: isImage,
            iconText: iconText);
}
