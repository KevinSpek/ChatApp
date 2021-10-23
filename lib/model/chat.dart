import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/user.dart';

class Chat {
  List<Message> messages;
  DateTime lastUpdated;
  List<String> uids;
  UserGp userToChat;

  Chat({
    required this.lastUpdated,
    required this.messages,
    required this.uids,
    required this.userToChat,
  });

  static Chat Empty() {
    return new Chat(lastUpdated: DateTime.now(), messages: [], uids: [], userToChat: UserGp.empty());
  }
}
