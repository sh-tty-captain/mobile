import 'package:bekhterev_app/adapters/ui/receipts.dart';
import 'package:bekhterev_app/layers/models/ui/receipts.dart';
import 'package:bekhterev_app/layers/services/receipts.dart';
import 'package:bekhterev_app/layers/use_cases/receipts.dart';

class ReceiptsUseCaseImpl implements ReceiptsUseCase {
  final ReceiptsService _receiptsService;
  final ReceiptsAdapter _receiptsAdapter;

  ReceiptsUseCaseImpl(
    this._receiptsService,
    this._receiptsAdapter,
  );

  @override
  Future<void> deleteReceipt(String id) => _receiptsService.deleteReceipt(id);

  @override
  Future<Receipt> getDetailsById(String id) async {
    final receipt = await _receiptsService.getReceiptById(id);
    return _receiptsAdapter.createReceipt(receipt);
  }

  @override
  Future<Receipts> getReceipts() async {
    final newReceipts = await _receiptsService.getNewReceipts();
    final allReceipts = await _receiptsService.getAllReceipts();
    return _receiptsAdapter.createReceipts(newReceipts, allReceipts);
  }

  @override
  Future<Iterable<Receipt>> searchReceipts(String key) async {
    final receipts = await _receiptsService.searchReceipts(key);
    return receipts.map(_receiptsAdapter.createReceipt);
  }
}
