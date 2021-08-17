class Item {
  String title;
  String date;
  String description;
  String modal;

  Item({required this.title, required this.date, required this.description, required this.modal});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        title: json['title'] as String,
        date: json['date'] as String,
        description: json['description'] as String,
        modal: json['modal'] as String);
  }

  fromJson(json) {
    return Item(
        title: json['title'] as String,
        date: json['date'] as String,
        description: json['description'] as String,
        modal: json['modal'] as String);
  }

  void removeAt(Item data) {}

  copy(Item oldDetail) {}
}
