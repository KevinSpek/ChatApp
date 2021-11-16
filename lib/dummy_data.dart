import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/channels/channel_group_chat.dart';
import 'package:groupidy/model/channels/news.dart';
import 'package:groupidy/model/chat.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/model/message.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/model/post.dart';
import 'package:groupidy/model/user.dart';

String dUid = '1';

UserGp dUser1 = UserGp(uid: '1', tag: 'ab12', nickname: 'Eden', imgPath: 'https://media-exp1.licdn.com/dms/image/C4D03AQEQe6M3QwTC0w/profile-displayphoto-shrink_200_200/0/1561177184315?e=1636588800&v=beta&t=gGT8U9O7wb1TkjbUcusCYrT0aFpJ_ruE8ANmKV5AMPA');
UserGp dUser2 = UserGp(uid: '2', tag: 'Vf43', nickname: 'Barak', imgPath: 'https://media-exp1.licdn.com/dms/image/C4D03AQFRv1zfNm1LxQ/profile-displayphoto-shrink_100_100/0/1589882621994?e=1636588800&v=beta&t=ZACv92u-qzGmEomhZlhQngvkErWiYUy7Q6jWo8MyMaI');
UserGp dUser3 = UserGp(uid: '3', tag: 'l432', nickname: 'Nethanel', imgPath: "https://fiverr-res.cloudinary.com/t_profile_original,q_auto,f_auto/attachments/profile/photo/d6ed158fde7e38a00e345019da620e7b-1522352574301/428b40f8-bf05-4ff8-9bdc-4ef72bb9e829.jpg");
UserGp dUser4 = UserGp(uid: '4', tag: 'j792', nickname: 'Kevin', imgPath: "https://media-exp1.licdn.com/dms/image/C4D03AQEaowcCOLbjHA/profile-displayphoto-shrink_200_200/0/1618726633039?e=1634169600&v=beta&t=F4b94FPBWoHjqeHeKiuOatlA1tmu_cnyq5M4diiEhk4");

Channel dChannel1 = ChannelGroupChat(pid: '1', name: 'Develop', cid: 'cid', iconText: 'DEV', isLimited: true, uidsAllowed: ['1', '3']);

Channel dChannel2 = ChannelNews(
    pid: '2',
    name: 'Administration',
    cid: '',
    isImage: true,
    desc: 'Channel for admin news & very important management updates',
    uidsAllowedToWrite: ['1', '2', '3', '4'],
    imgPath: "https://img.freepik.com/free-photo/golden-key-isolated-white-background-3d-illustration_87744-271.jpg?size=626&ext=jpg");

NotificationMessage dNotification1 = NotificationMessage(chatID: '123', notificationType: NotificationType.chatidy, numNewMessages: 10, time: DateTime.now());
NotificationMessage dNotification2 = NotificationMessage(chatID: '123', notificationType: NotificationType.forum, numNewMessages: 2, time: DateTime.now());
NotificationMessage dNotification3 = NotificationMessage(chatID: '123', notificationType: NotificationType.news, numNewMessages: 3, time: DateTime.now());
NotificationMessage dNotification4 = NotificationMessage(chatID: '123', notificationType: NotificationType.groupChat, numNewMessages: 7, time: DateTime.now());

List<Group> dGroups = [
  Group(gid: '', imgPath: 'images/dummy_game.png', lastUpdated: DateTime.now(), name: 'Gamerzzz', ownerUid: 'kev', tag: '123', uids: [], notifications: [dNotification1, dNotification2]),
  Group(gid: '', imgPath: 'images/dummy_wrest.png', lastUpdated: DateTime.now(), name: 'Wrestlers', ownerUid: 'kev', tag: '123', uids: [], notifications: [dNotification3, dNotification4]),
  Group(gid: '', imgPath: 'images/dummy_piano.png', lastUpdated: DateTime.now(), name: 'Piano Players', ownerUid: 'kev', tag: '123', uids: [], notifications: [dNotification4]),
];

Post dPost = Post(chatMsg: Message(senderUid: dUid, msg: loremIpsumLong, date: DateTime.now().subtract(Duration(minutes: 17)), senderNickname: "ntnlbar"));

List<UserGp> dUsers = [dUser1, dUser2, dUser3, dUser4];

List<Message> dGroupMessages = [
  Message(senderUid: '1', msg: 'Lets play tonight?', date: DateTime(2020, 12, 20, 17, 30), senderNickname: 'Eden'),
  Message(senderUid: '3', msg: 'I am in!', date: DateTime(2020, 12, 20, 17, 33), senderNickname: 'Nethanel'),
  Message(senderUid: '4', msg: 'Lets meet around 18:00', date: DateTime(2020, 12, 20, 17, 34), senderNickname: 'Kevin'),
  Message(senderUid: '2', msg: 'Cool im down', date: DateTime(2020, 12, 20), senderNickname: 'Barak'),
  Message(senderUid: '1', msg: 'Great then it is scheduled.', date: DateTime(2020, 12, 22), senderNickname: 'Kevin'),
];

List<Message> dChatidiyMessages = [
  Message(senderUid: '1', msg: 'Hey are you free?', date: DateTime(2020, 12, 24, 11, 22), senderNickname: 'Eden'),
  Message(senderUid: '2', msg: 'Yes what do you need', date: DateTime(2020, 12, 24, 11, 23), senderNickname: 'Barak'),
  Message(senderUid: '1', msg: 'Just checkin, wandering how are you', date: DateTime(2020, 12, 24, 11, 24), senderNickname: 'Eden'),
  Message(senderUid: '2', msg: 'Got it. bye.', date: DateTime(2020, 12, 24, 11, 25), senderNickname: 'Barak'),
];

List<Message> dChatidiyMessages2 = [
  Message(senderUid: '3', msg: 'Hello!', date: DateTime(2020, 12, 24, 11, 23), senderNickname: 'ntnlbar'),
  Message(senderUid: '1', msg: 'Hey are you?', date: DateTime(2020, 12, 24, 11, 22), senderNickname: 'Eden'),
  Message(senderUid: '1', msg: 'I have exiting news', date: DateTime(2020, 12, 24, 11, 24), senderNickname: 'Eden'),
  Message(senderUid: '3', msg: 'What are the new? I cannot wait!', date: DateTime(2020, 12, 24, 11, 25), senderNickname: 'ntnlbar'),
];

Channel pidNews = ChannelNews(pid: 'pidNews', name: 'News', cid: '', uidsAllowedToWrite: ['1']);

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

Post dPost1 = Post(chatMsg: Message(senderUid: '1', msg: loremIpsumLong, date: DateTime(2020, 12, 24, 11, 24), senderNickname: 'Eden'), comments: 1, likes: 2);

Post dPost2 = Post(chatMsg: Message(senderUid: '2', msg: loremIpsumShort, date: DateTime(2020, 12, 24, 11, 29), senderNickname: 'Barak'), comments: 3, likes: 29);

Chat dChat1 = Chat(lastUpdated: DateTime.now().subtract(Duration(minutes: 6)), messages: dChatidiyMessages, uids: ["1", "2"], userToChat: UserGp(uid: '2', tag: '#123', nickname: 'Barak'));

Chat dChat2 = Chat(
    lastUpdated: DateTime.now().subtract(Duration(minutes: 13)),
    messages: dChatidiyMessages2,
    uids: ["1", "3"],
    userToChat: UserGp(uid: '3', tag: '#123', nickname: 'ntnlbar', imgPath: "https://fiverr-res.cloudinary.com/t_profile_original,q_auto,f_auto/attachments/profile/photo/d6ed158fde7e38a00e345019da620e7b-1522352574301/428b40f8-bf05-4ff8-9bdc-4ef72bb9e829.jpg"));

List<Chat> dChats = [
  dChat1,
  dChat2,
];

//Channel dChannel3 = ChannelForum(pid: '3', name: 'HR', posts: [dPost1, dPost2], iconText: 'FR');

//List<Channel> dChannels = [dChannel1, dChannel2, dChannel3];
