class Receipt {
  final String id;
  final String title;
  final DateTime date;
  final String procedure;
  final String paymentMethod;
  final String cost;
  final bool isNew;

  const Receipt({
    required this.id,
    required this.title,
    required this.date,
    required this.procedure,
    required this.paymentMethod,
    required this.cost,
    required this.isNew,
  });
}
