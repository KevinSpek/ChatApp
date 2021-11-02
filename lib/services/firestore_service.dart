import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/chatChannel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/user.dart';

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static getGroup(
      String gid, Function(DocumentSnapshot<Map<String, dynamic>>) onComplete) {
    firestore.collection('groups').doc(gid).get().then(onComplete);
  }

  static Future<void> createGroup(String name, String ownerUid) {
    var gid = firestore.collection('groups').doc().id;
    Group groupToCreate = Group.createNewGroup(gid, name, ownerUid);

    return firestore
        .collection('groups')
        .doc(gid)
        .withConverter<Group>(
            fromFirestore: (doc, _) => Group.fromMap(doc.data()!),
            toFirestore: (group, _) => Group.toMap(group))
        .set(groupToCreate);
  }

  static Future<void> updateGroup(String gid, Map<String, Object?> updatedData) {
    return firestore
        .collection('groups')
        .doc(gid)
        .update(updatedData);
  }

  static Future<Channel> createChannel(String gid, String name, ChannelType type,
      bool isImage, String iconText, String imgPath) {
    var pid = firestore
        .collection('groups')
        .doc('gid')
        .collection('channels')
        .doc()
        .id;
    var channelToCreate =
        Channel.createChannel(pid, name, type, isImage, iconText, imgPath);

    var batch = firestore.batch();
    var channelRef = firestore
        .collection('groups')
        .doc(gid)
        .collection('channels')
        .doc(pid)
        .withConverter<Channel>(
            fromFirestore: (doc, _) => Channel.fromMap(doc.data()!),
            toFirestore: (channel, _) => Channel.toMap(channel));

    batch.set<Channel>(channelRef, channelToCreate);

    if (channelToCreate.isChatChannel()) {
      var chatToCreate = ChatChannel.createChat(channelToCreate.getCid());

      var chatRef = firestore
          .collection('chats')
          .doc(channelToCreate.getCid())
          .withConverter<ChatChannel>(
              fromFirestore: (doc, _) => ChatChannel.fromMap(doc.data()!),
              toFirestore: (chat, _) => ChatChannel.toMap(chat));

      batch.set<ChatChannel>(chatRef, chatToCreate);
    }

    return batch.commit().then((_) => channelToCreate);
  }

  static String getCid() {
    return firestore.collection('chats').doc().id;
  }

  // FirestoreService.getChannel(gid, pid).then((DocumentSnapshot<Channel> doc) {doc.data()})
  // var doc = await FirestoreService.getChannel(gid, pid);
  // doc.data();
  static Future<DocumentSnapshot<Channel>> getChannel(String gid, String pid) {
    return firestore
        .collection('groups')
        .doc(gid)
        .collection('channels')
        .doc(pid)
        .withConverter<Channel>(
            fromFirestore: (doc, _) => Channel.fromMap(doc.data()!),
            toFirestore: (channel, _) => Channel.toMap(channel))
        .get();
  }

  static Future<QuerySnapshot<Channel>> getChannels(String gid) {
    return firestore
        .collection('groups')
        .doc(gid)
        .collection('channels')
        //.where('isLimited', isEqualTo: false)
        .withConverter<Channel>(
            fromFirestore: (doc, _) => Channel.fromMap(doc.data()!),
            toFirestore: (channel, _) => Channel.toMap(channel))
        .get();
  }

  static Future<void> updateChannel(
      String gid, String pid, Map<String, Object?> data) {
    return firestore
        .collection('groups')
        .doc(gid)
        .collection('channels')
        .doc(pid)
        .update(data);
  }

  static getUser(String uid, Function(UserGp?) onComplete) {
    firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) {
      if (doc.exists) {
        onComplete(UserGp.fromMap(doc.data()!));
      }
      onComplete(null);
    });
  }

  static Future<void> addMessage(String cid, Message message) {
    return firestore
        .collection('chats')
        .doc(cid)
        .collection('messages')
        .doc()
        .withConverter<Message>(
            fromFirestore: (doc, _) => Message.fromMap(doc.data()!),
            toFirestore: (message, _) => Message.toMap(message))
        .set(message);
  }

  static Future<QuerySnapshot<Message>> getMessages(String cid) {
    return firestore
        .collection('chats')
        .doc(cid)
        .collection('messages')
        .withConverter<Message>(
            fromFirestore: (doc, _) => Message.fromMap(doc.data()!),
            toFirestore: (message, _) => Message.toMap(message))
        .orderBy('date')
        .limit(10)
        .get();
  }

  static Stream<QuerySnapshot<Message>> setChatListener(String cid) {
    return firestore
      .collection('chats')
      .doc(cid)
      .collection('messages')
      .withConverter<Message>(
            fromFirestore: (doc, _) => Message.fromMap(doc.data()!),
            toFirestore: (message, _) => Message.toMap(message))
      .orderBy('date')
      .limit(5)
      .snapshots();
  }

  static Future<DocumentSnapshot<ChatChannel>> getChat(String cid) {
    return firestore
        .collection('chats')
        .doc(cid)
        .withConverter<ChatChannel>(
            fromFirestore: (doc, _) => ChatChannel.fromMap(doc.data()!),
            toFirestore: (chat, _) => ChatChannel.toMap(chat))
        .get();
  }
}
