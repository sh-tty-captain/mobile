class NotificationInfo {
  final String id;
  final String title;
  final String date;
  final String shortDescription;
  final String fullDescription;
  final bool isNew;

  NotificationInfo({
    required this.id,
    required this.title,
    required this.date,
    required this.shortDescription,
    required this.fullDescription,
    required this.isNew,
  });
}
