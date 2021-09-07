import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/model/message.dart';

class News extends Channel {
  List<Message> messages;

  News({pid, name, required this.messages}) : super(pid: pid, name: name, chanType: ChannelType.news);

  void addMessages(List<Message> newMessages) {
    messages = messages + newMessages;
  }
}
