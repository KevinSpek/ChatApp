import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';

class ChannelNews extends Channel {
  List<Message> messages;

  ChannelNews({pid, name, imgPath = '', required this.messages}) : super(pid: pid, name: name, type: ChannelType.news, imgPath : imgPath);

  void addMessages(List<Message> newMessages) {
    messages = messages + newMessages;
  }
}
