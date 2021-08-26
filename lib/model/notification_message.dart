enum NotificationType { chatidy, tag, forum, news, groupChat }

class NotificationMessage {
  final String chatID;
  final int numNewMessages;
  final DateTime time;
  final NotificationType notificationType;

  NotificationMessage({
    required this.numNewMessages,
    required this.chatID,
    required this.notificationType,
    required this.time,
  });
}
