import 'package:bekhterev_app/layers/models/ui/notification.dart';

abstract class NotificationsUseCase {
  Future<Iterable<NotificationInfo>> getNotifications();

  Future<Iterable<NotificationInfo>> searchNotifications(String key);

  Future<NotificationInfo> getDetailsById(String id);

  Future<void> deleteNotification(String id);
}
