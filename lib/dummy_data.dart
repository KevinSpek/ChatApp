import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/user.dart';

List<Group> dGroups = [
  Group(
    gid: '',
    imgPath: '',
    lastUpdated: DateTime.now(),
    name: 'My group',
    ownerUid: 'kev',
    tag: '123',
    uids: [],
  ),
  Group(
    gid: '',
    imgPath: '',
    lastUpdated: DateTime.now(),
    name: 'Another group',
    ownerUid: 'kev',
    tag: '123',
    uids: [],
  ),
  Group(
    gid: '',
    imgPath: '',
    lastUpdated: DateTime.now(),
    name: 'One more',
    ownerUid: 'kev',
    tag: '123',
    uids: [],
  ),
];

List<User> dUsers = [
  User(uid: '1', tag: '#123', nickname: 'Eden'),
  User(uid: '2', tag: '#153', nickname: 'Barak'),
  User(uid: '3', tag: '#432', nickname: 'Nethanel'),
  User(uid: '4', tag: '#792', nickname: 'Kevin'),
];

List<Message> dGroupMessages = [
  Message(senderID: '1', msg: 'Lets play tonight?', date: DateTime(2020, 12, 20, 17, 30), userNickname: 'Eden'),
  Message(senderID: '3', msg: 'I am in!', date: DateTime(2020, 12, 20, 17, 33), userNickname: 'Nethanel'),
  Message(senderID: '4', msg: 'Lets meet around 18:00', date: DateTime(2020, 12, 20, 17, 34), userNickname: 'Kevin'),
  Message(senderID: '2', msg: 'Cool im down', date: DateTime(2020, 12, 20), userNickname: 'Barak'),
  Message(senderID: '1', msg: 'Great then it is scheduled.', date: DateTime(2020, 12, 22), userNickname: 'Kevin'),
];

List<Message> dChatidiyMessages = [
  Message(senderID: '1', msg: 'Hey are you free?', date: DateTime(2020, 12, 24, 11, 22), userNickname: 'Eden'),
  Message(senderID: '2', msg: 'Yes what do you need', date: DateTime(2020, 12, 24, 11, 23), userNickname: 'Barak'),
  Message(senderID: '1', msg: 'Just checkin, wandering how are you', date: DateTime(2020, 12, 24, 11, 24), userNickname: 'Eden'),
  Message(senderID: '2', msg: 'Got it. bye.', date: DateTime(2020, 12, 24, 11, 25), userNickname: 'Barak'),
];
