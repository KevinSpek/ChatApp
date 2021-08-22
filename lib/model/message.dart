class Message {
  final String senderID;
  final String msg;
  final DateTime date;
  final String userNickname;

  Message({
    required this.senderID,
    required this.msg,
    required this.date,
    required this.userNickname,
  });
}
