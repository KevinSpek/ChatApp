import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/message.dart';
import 'chat.dart';

class ChatChannel extends Chat {

  ChatChannel({
    required cid,
    required lastUpdated,
    required messages,
  }) : super(cid: cid, uids: [], messages: messages, userToChat: dUser1, lastUpdated: lastUpdated);

  static ChatChannel createChat(String cid) {
    return new ChatChannel(cid: cid, lastUpdated: DateTime.now(), messages: <Message>[]);
  }

  static ChatChannel fromMap(Map<String, dynamic> map) {
    return new ChatChannel(
      cid: map['cid'],
      lastUpdated: map['lastUpdated']?.toDate(),
      messages: <Message>[]);
  }

  static Map<String, dynamic> toMap(ChatChannel chat) {
    return {
      'cid': chat.cid,
      'lastUpdated': chat.lastUpdated,
    };
  }

  static ChatChannel empty() => new ChatChannel(cid: '', lastUpdated: DateTime.now(), messages: <Message>[]);
}