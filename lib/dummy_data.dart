import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/post.dart';
import 'package:groupidy/model/user.dart';

String dUid = '1';

List<Group> dGroups = [
  Group(
    gid: '',
    imgPath: '',
    lastUpdated: DateTime.now(),
    name: 'My group',
    ownerUid: 'kev',
    tag: '123',
    uids: [],
    pids: ['pidGroupChat'],
  ),
  Group(gid: '', imgPath: '', lastUpdated: DateTime.now(), name: 'Another group', ownerUid: 'kev', tag: '123', uids: [], pids: ['pidForum']),
  Group(gid: '', imgPath: '', lastUpdated: DateTime.now(), name: 'One more', ownerUid: 'kev', tag: '123', uids: [], pids: ['pidNews']),
];

Post dPost = Post(chatMsg: Message(senderID: dUid, msg: loremIpsumLong, date: DateTime.now().subtract(Duration(minutes: 17)), userNickname: "ntnlbar"));

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

Channel pidNews = News(pid: 'pidNews', name: 'News', messages: dGroupMessages);

// Channel pidForum = Channel(pid: 'pidForum', name: 'Forum');
// Channel pidGroupChat = Channel(pid: 'pidGroupChat', name: 'Group chat');

String loremIpsumShort = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus volutpat odio id purus sodales bibendum. Nunc vel nulla sed quam fermentum efficitur.''';

String loremIpsumLong = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec laoreet vel dui a volutpat. Mauris semper risus blandit nunc posuere, sit amet tincidunt lacus hendrerit. Fusce tempus eros sit amet nulla ullamcorper, sed feugiat mauris efficitur. Phasellus blandit lacus odio, vitae consectetur tellus varius vel. Ut condimentum rhoncus vestibulum. Nulla at tortor a odio pharetra cursus ac vitae justo. Phasellus tempor sapien vitae velit vehicula sollicitudin. Aliquam egestas ipsum lacus, non viverra quam cursus nec. Donec bibendum mauris ipsum, in tincidunt arcu bibendum ut. Duis cursus sollicitudin lectus vitae vulputate.

Praesent commodo maximus risus non fermentum. Integer malesuada aliquam ante fermentum ultrices. Ut et quam viverra, aliquam magna nec, accumsan arcu. Mauris vitae ornare dolor. In interdum erat sit amet pulvinar sodales. Phasellus convallis lacinia arcu sed lacinia. Donec blandit mattis velit, eget pellentesque arcu interdum ac. Sed non sapien neque. Integer sit amet ornare ex, in vestibulum mauris. Nullam a velit euismod, lobortis ligula et, bibendum felis. Aenean vitae tincidunt enim. Aenean a leo lacus. Aenean et porta ipsum. Nam ultricies, ipsum vel sagittis rutrum, ipsum sem scelerisque orci, eu porttitor lorem est sit amet magna. Curabitur odio tellus, vulputate rutrum velit congue, tincidunt fringilla enim.

Donec eget tempus mi. Phasellus quis consequat eros. Cras nec sapien congue, convallis eros eu, finibus nisi. Proin elit lorem, ornare quis iaculis nec, imperdiet a mauris. Aliquam quis facilisis risus. Etiam malesuada nunc nec risus sagittis porttitor. Vivamus in lectus sagittis, mattis felis eget, pretium ante. Praesent et pulvinar leo. Nullam eu gravida augue. Sed porttitor, orci non pulvinar sodales, felis enim interdum ante, non imperdiet lacus nisl quis tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus in tempus nisl. Proin convallis venenatis suscipit. Duis rhoncus odio sit amet orci congue, porttitor tempor nulla porttitor. Sed sapien augue, suscipit in libero vitae, dapibus vestibulum felis.

Pellentesque ut urna purus. Praesent ut nulla sem. Etiam sed elit odio. Suspendisse risus est, tempus vel tellus eget, varius fringilla nulla. Cras vitae velit a magna volutpat sodales eget vel elit. Quisque finibus, sapien non rhoncus porttitor, ipsum mi lacinia mauris, id pulvinar est augue non metus. Nullam sit amet nisi et est mollis hendrerit vel ac dui. Nulla erat tellus, egestas eget massa sit amet, consequat sodales orci. Vivamus cursus aliquam turpis, ut iaculis risus interdum ut. Praesent pellentesque pellentesque commodo. Nulla cursus magna ante, sed accumsan orci blandit id.

Mauris gravida imperdiet dui, eget condimentum sapien eleifend vitae. Sed lobortis, purus sit amet convallis tincidunt, mi lorem pellentesque ipsum, quis commodo ligula justo ut mauris. Vestibulum eu justo sit amet ex fermentum dictum. Vivamus massa nulla, feugiat non tellus vel, laoreet pulvinar lectus. Pellentesque lectus ex, commodo sit amet eleifend a, imperdiet eget metus. Nunc placerat tellus lectus, rhoncus blandit justo tincidunt ac. Donec justo nisl, aliquam vitae magna a, aliquet gravida nisi. In vestibulum neque eget eleifend blandit. Vivamus porta volutpat turpis quis ullamcorper. Praesent sit amet tristique quam, vitae porttitor nibh. Nulla mattis vestibulum libero ac faucibus.''';

Post dPost1 = Post(chatMsg: Message(senderID: '1', msg: loremIpsumLong, date: DateTime(2020, 12, 24, 11, 24), userNickname: 'Eden'), comments: 1, likes: 2);
