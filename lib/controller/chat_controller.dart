import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/chatChannel.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/services/firestore_service.dart';

class ChatController extends GetxController {
  var channelChat = Rx<ChatChannel?>(null);
  // ignore: cancel_subscriptions
  StreamSubscription<QuerySnapshot<Message>>? _messegesListener;

  void loadChat(String cid) {
    if (channelChat.value?.cid != cid) {
      channelChat.value?.messages.clear();
      FirestoreService.getChat(cid).then((doc) {
        channelChat.value = doc.data();
        setListener();
      });
    } 
  }

  void addMessage(String message) {
    if (channelChat.value == null) {
      print("channelChat is null!");
      return;
    }

    var messageObject = new Message(senderUid: '', senderNickname: 'nix', date: DateTime.now(), msg: message);
    FirestoreService.addMessage(channelChat.value!.cid, messageObject);
  }

  void loadMessages() {
    if (channelChat.value == null)
      return;
    
    FirestoreService.getMessages(channelChat.value!.cid)
      .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          channelChat.value!.messages.add(element.data());
        });
        channelChat.refresh();
      });
  }

  void setListener() {
    if (channelChat.value == null)
      return;

    if (_messegesListener != null) {
      _messegesListener!.cancel();
    }

    _messegesListener = FirestoreService.setChatListener(channelChat.value!.cid).listen((event) { 
      event.docChanges.forEach((element) {
        channelChat.value!.messages.add(element.doc.data()!);
      });
      channelChat.refresh();
    });
  }

  Chat getChat() => channelChat.value ?? ChatChannel.empty();
}
