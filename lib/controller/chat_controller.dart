import 'package:get/get.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/chatChannel.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/services/firestore_service.dart';

class ChatController extends GetxController {
  var channelChat = Rx<ChatChannel?>(null);

  void loadChat(String cid) {
    FirestoreService.getChat(cid).then((doc) {
      channelChat.value = doc.data();
    });
  }

  void addMessage(String message, ) {
    if (channelChat.value == null) {
      print("channelChat is null!");
      return;
    }

    var messageObject = new Message(senderUid: '', senderNickname: 'nix', date: DateTime.now(), msg: message);
    FirestoreService.addMessage(channelChat.value!.cid, messageObject);
    channelChat.value!.messages.add(messageObject);
    channelChat.refresh();
  }

  Chat getChat() => channelChat.value ?? ChatChannel.empty();
}
