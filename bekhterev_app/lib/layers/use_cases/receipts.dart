import 'package:bekhterev_app/layers/models/ui/receipts.dart';

abstract class ReceiptsUseCase {
  Future<Receipts> getReceipts();

  Future<Iterable<Receipt>> searchReceipts(String key);

  Future<Receipt> getDetailsById(String id);

  Future<void> deleteReceipt(String id);
}
