import 'package:chatapp/model/message.dart';
import 'package:chatapp/model/user.dart';

class Chat {
  final String cid;
  List<Message> messages;
  DateTime lastUpdated;
  List<String> uids;
  UserGp userToChat;

  Chat({
    this.cid = '',
    required this.lastUpdated,
    required this.messages,
    required this.uids,
    required this.userToChat,
  });

  static Chat createChat() {
    return new Chat(lastUpdated: DateTime.now(), messages: <Message>[], uids: <String>[], userToChat: UserGp.empty());
  }

  static Chat fromMap(Map<String, dynamic> map) {
    return new Chat(cid: map['cid'], lastUpdated: map['lastUpdated'], messages: <Message>[], uids: map['uid'], userToChat: map['userToChat']);
  }

  static Map<String, dynamic> toMap(Chat chat) {
    return {'cid': chat.cid, 'lastUpdated': chat.lastUpdated, 'uids': chat.uids, 'userToChat': chat.userToChat};
  }

  static Chat empty() {
    return new Chat(lastUpdated: DateTime.now(), messages: [], uids: [], userToChat: UserGp.empty());
  }
}
