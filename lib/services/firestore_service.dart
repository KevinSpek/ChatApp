import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/user.dart';

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static getGroup(String gid, Function(DocumentSnapshot<Map<String, dynamic>>) onComplete) {
    firestore.collection('groups').doc(gid).get().then(onComplete);
  }

  static Future<void> createGroup(String name, String ownerUid) {
    var gid = firestore.collection('groups').doc().id;
    Group groupToCreate = Group.createNewGroup(gid, name, ownerUid);

    return firestore.collection('groups').doc(gid).withConverter<Group>(fromFirestore: (doc, _) => Group.fromMap(doc.data()!), toFirestore: (group, _) => Group.toMap(group)).set(groupToCreate);
  }

  // FirestoreService.getChannel(gid, pid).then((DocumentSnapshot<Channel> doc) {doc.data()})
  // var doc = await FirestoreService.getChannel(gid, pid);
  // doc.data();
  static Future<DocumentSnapshot<Channel>> getChannel(String gid, String pid) {
    return firestore.collection('groups').doc(gid).collection('channels').doc(pid).withConverter<Channel>(fromFirestore: (doc, _) => Channel.fromMap(doc.data()!), toFirestore: (channel, _) => Channel.toMap(channel)).get();
  }

  static getUser(String uid, Function(UserGp?) onComplete) {
    firestore.collection('users').doc(uid).get().then((DocumentSnapshot<Map<String, dynamic>> doc) {
      if (doc.exists) {
        onComplete(UserGp.fromMap(doc.data()!));
      }
      onComplete(null);
    });
  }

  static Future<bool> isUserExists(String uid) async {
    var docRef = firestore.collection('users').doc(uid);
    var doc = await docRef.get();
    return doc.exists;
  }

  static Future<void> createUser(UserGp userToCreate) {
    return firestore.collection('users').doc(userToCreate.uid).withConverter<UserGp>(fromFirestore: (doc, _) => UserGp.fromMap(doc.data()!), toFirestore: (user, _) => UserGp.toMap(user)).set(userToCreate);
  }
}
