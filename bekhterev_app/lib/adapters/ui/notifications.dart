import 'package:bekhterev_app/layers/models/domain/notification.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/notification.dart';

class NotificationsAdapter {
  NotificationInfo createNotification(domain.NotificationInfo notification) {
    return NotificationInfo(
      id: notification.id,
      title: notification.title,
      date: notification.date.toString(),
      shortDescription: notification.shortDescription,
      fullDescription: notification.fullDescription,
      isNew: notification.isNew,
    );
  }
}
