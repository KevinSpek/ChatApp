import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';

class ChannelNews extends Channel {
  List<Message> messages;

  ChannelNews({
    pid,
    name,
    imgPath = '',
    this.messages = const [],
    isImage = false,
    iconText,
    desc,
    isLimited = false,
    uidsAllowed,
    uidsAllosedToWrite,
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
          uidsAllowedToWrite: uidsAllosedToWrite,
        );

  void addMessages(List<Message> newMessages) {
    messages = messages + newMessages;
  }
}
