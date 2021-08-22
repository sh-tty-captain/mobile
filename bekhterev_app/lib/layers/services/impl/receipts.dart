import 'package:bekhterev_app/layers/models/domain/receipts.dart';
import 'package:bekhterev_app/layers/services/receipts.dart';

class ReceiptsServiceImpl implements ReceiptsService {
  final _data = <Receipt>[
    Receipt(
      id: '1',
      title: 'Новая квитанция 1',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Банковская карта',
      cost: '3500 руб.',
      isNew: true,
    ),
    Receipt(
      id: '2',
      title: 'Новая квитанция 2',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Apple Pay',
      cost: '4200 руб.',
      isNew: true,
    ),
    Receipt(
      id: '3',
      title: 'Квитанция ',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Apple Pay',
      cost: '2500 руб.',
      isNew: false,
    ),
    Receipt(
      id: '4',
      title: 'Квитанция 2',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Apple Pay',
      cost: '5700 руб.',
      isNew: false,
    ),
    Receipt(
      id: '5',
      title: 'Квитанция 3',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Банковская карта',
      cost: '1800 руб.',
      isNew: false,
    ),
    Receipt(
      id: '6',
      title: 'Квитанция 4',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Банковская карта',
      cost: '7100 руб.',
      isNew: false,
    ),
    Receipt(
      id: '7',
      title: 'Квитанция 5',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Банковская карта',
      cost: '3200 руб.',
      isNew: false,
    ),
    Receipt(
      id: '8',
      title: 'Квитанция 5',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Apple Pay',
      cost: '4000 руб.',
      isNew: false,
    ),
    Receipt(
      id: '9',
      title: 'Квитанция 6',
      date: DateTime.now(),
      procedure: 'Магнитнорезонансная томография',
      paymentMethod: 'Банковская карта',
      cost: '2600 руб.',
      isNew: false,
    ),
  ];

  @override
  Future<Iterable<Receipt>> getNewReceipts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _data.where((it) => it.isNew);
  }

  @override
  Future<Iterable<Receipt>> getAllReceipts() async {
    final _old = _data.where((it) => !it.isNew);
    final _new = _data.where((it) => it.isNew);

    await Future.delayed(const Duration(seconds: 1));
    return [..._new, ..._old];
  }

  @override
  Future<Iterable<Receipt>> searchReceipts(String key) async {
    await Future.delayed(const Duration(seconds: 1));
    return _data.where((receipt) =>
    receipt.title.toLowerCase().contains(key.toLowerCase()) &&
        receipt.procedure.toLowerCase().contains(key.toLowerCase()));
  }

  Future<Receipt> getReceiptById(String id) async {
    return _data.firstWhere((receipt) => receipt.id == id);
  }

  @override
  Future<void> deleteReceipt(String id) async {
    _data.removeWhere((receipt) => receipt.id == id);
  }
}
