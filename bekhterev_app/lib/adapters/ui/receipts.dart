import 'package:bekhterev_app/layers/models/domain/receipts.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/receipts.dart';

class ReceiptsAdapter {
  Receipts createReceipts(
    Iterable<domain.Receipt> newReceipts,
    Iterable<domain.Receipt> allReceipts,
  ) {
    return Receipts(
      newReceipts: newReceipts.map(createReceipt),
      allReceipts: allReceipts.map(createReceipt),
    );
  }

  Receipt createReceipt(domain.Receipt receipt) {
    return Receipt(
      id: receipt.id,
      title: receipt.title.toUpperCase(),
      date: receipt.date.toString(),
      procedure: receipt.procedure,
      paymentMethod: receipt.paymentMethod,
      cost: receipt.cost,
      isNew: receipt.isNew,
    );
  }
}
