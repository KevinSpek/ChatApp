import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';

class ChannelNews extends Channel {
  List<Message> messages;

  ChannelNews({
    pid,
    name,
    imgPath = '',
    required this.messages,
    isImage = false,
    iconText,
    desc,
    isLimited = false
  }) : super(
            pid: pid,
            name: name,
            type: ChannelType.news,
            imgPath: imgPath,
            isImage: isImage,
            iconText: iconText,
            desc: desc,
            isLimited: isLimited);

  void addMessages(List<Message> newMessages) {
    messages = messages + newMessages;
  }
}
