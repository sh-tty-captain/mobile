import 'package:bekhterev_app/layers/models/domain/notification.dart';
import 'package:bekhterev_app/layers/services/notifications.dart';

class NotificationsServiceImpl implements NotificationsService {
  final _data = <NotificationInfo>[
    NotificationInfo(
      id: '1',
      title: 'Новое уведомление 1',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
      isNew: true,
    ),
    NotificationInfo(
      id: '2',
      title: 'Новое уведомление 2',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
      isNew: true,
    ),
    NotificationInfo(
      id: '3',
      title: 'Уведомление 3',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
      isNew: false,
    ),
    NotificationInfo(
      id: '4',
      title: 'Уведомление 4',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
      isNew: false,
    ),
    NotificationInfo(
      id: '5',
      title: 'Уведомление 5',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
      isNew: false,
    ),
  ];

  @override
  Future<Iterable<NotificationInfo>> getNotifications() async {
    final _old = _data.where((it) => !it.isNew);
    final _new = _data.where((it) => it.isNew);

    await Future.delayed(const Duration(seconds: 2));
    return [..._new, ..._old];
  }

  @override
  Future<Iterable<NotificationInfo>> searchNotifications(String key) async {
    await Future.delayed(const Duration(seconds: 2));
    return _data.where((notification) =>
        notification.title.toLowerCase().contains(key.toLowerCase()) &&
        notification.fullDescription.toLowerCase().contains(key.toLowerCase()) &&
        notification.shortDescription.toLowerCase().contains(key.toLowerCase()));
  }

  Future<NotificationInfo> getNotificationById(String id) async {
    return _data.firstWhere((notification) => notification.id == id);
  }

  @override
  Future<void> deleteNotification(String id) async {
    _data.removeWhere((notification) => notification.id == id);
  }
}
