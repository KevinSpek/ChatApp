import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/message.dart';

class News extends Channel {
  List<Message> messages = [];

  News({pid, name}) : super(pid: pid, name: name);
}
