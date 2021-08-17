class Receipts {
  final Iterable<Receipt> newReceipts;
  final Iterable<Receipt> allReceipts;

  Receipts({
    required this.newReceipts,
    required this.allReceipts,
  });
}

class Receipt {
  final String id;
  final String title;
  final String date;
  final String procedure;
  final String paymentMethod;
  final String cost;
  final bool isNew;

  Receipt({
    required this.id,
    required this.title,
    required this.date,
    required this.procedure,
    required this.paymentMethod,
    required this.cost,
    required this.isNew,
  });
}
