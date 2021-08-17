import 'package:bekhterev_app/layers/models/domain/notification.dart';

abstract class NotificationsService {
  Future<Iterable<NotificationInfo>> getNotifications();

  Future<Iterable<NotificationInfo>> searchNotifications(String key);

  Future<NotificationInfo> getNotificationById(String id);

  Future<void> deleteNotification(String id);
}
