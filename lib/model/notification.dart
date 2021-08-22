enum NotificationType { chatidy, tag, forum, news, groupChat }

class Notification {
  final String chatID;
  final NotificationType notificationType;

  Notification({
    required this.chatID,
    required this.notificationType,
  });
}
