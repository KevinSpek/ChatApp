class Message {
  final String senderUid;
  final String msg;
  final DateTime date;
  final String senderNickname;

  Message({
    required this.senderUid,
    required this.msg,
    required this.date,
    required this.senderNickname,
  });

  static Message fromMap(Map<String, dynamic> map) {
    return new Message(
      senderUid: map['senderUid'], 
      msg: map['msg'], 
      date: map['date']?.toDate(), 
      senderNickname: map['senderNickname']);
  }

  static Map<String, dynamic> toMap(Message message) {
    return {
      'senderUid': message.senderUid,
      'msg': message.msg,
      'date': message.date,
      'senderNickname': message.senderNickname
    };
  }
}
