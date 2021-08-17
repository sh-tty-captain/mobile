import 'package:bekhterev_app/adapters/ui/notifications.dart';
import 'package:bekhterev_app/layers/models/ui/notification.dart';
import 'package:bekhterev_app/layers/services/notifications.dart';
import 'package:bekhterev_app/layers/use_cases/notifications.dart';

class NotificationsUseCaseImpl implements NotificationsUseCase {
  final NotificationsService _notificationsService;
  final NotificationsAdapter _notificationsAdapter;

  NotificationsUseCaseImpl(
    this._notificationsService,
    this._notificationsAdapter,
  );

  @override
  Future<void> deleteNotification(String id) => _notificationsService.deleteNotification(id);

  @override
  Future<NotificationInfo> getDetailsById(String id) async {
    final notification = await _notificationsService.getNotificationById(id);
    return _notificationsAdapter.createNotification(notification);
  }

  @override
  Future<Iterable<NotificationInfo>> getNotifications() async {
    final notifications = await _notificationsService.getNotifications();
    return notifications.map(_notificationsAdapter.createNotification);
  }

  @override
  Future<Iterable<NotificationInfo>> searchNotifications(String key) async {
    final notifications = await _notificationsService.searchNotifications(key);
    return notifications.map(_notificationsAdapter.createNotification);
  }
}
