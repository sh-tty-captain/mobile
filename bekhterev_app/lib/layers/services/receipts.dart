import 'package:bekhterev_app/layers/models/domain/receipts.dart';

abstract class ReceiptsService {
  Future<Iterable<Receipt>> getNewReceipts();

  Future<Iterable<Receipt>> getAllReceipts();

  Future<Iterable<Receipt>> searchReceipts(String key);

  Future<Receipt> getReceiptById(String id);

  Future<void> deleteReceipt(String id);
}
