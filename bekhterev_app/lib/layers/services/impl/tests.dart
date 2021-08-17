import 'package:bekhterev_app/layers/models/domain/tests.dart';
import 'package:bekhterev_app/layers/services/tests.dart';

class TestsServiceImpl implements TestsService {
  final _data = <Test>[
    Test(
      id: '1',
      title: 'Название теста 1',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      isNew: true,
    ),
    Test(
      id: '2',
      title: 'Название теста 2',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      isNew: true,
    ),
    Test(
      id: '3',
      title: 'Название теста 3',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      isNew: false,
    ),
    Test(
      id: '4',
      title: 'Название теста 4',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      isNew: false,
    ),
    Test(
      id: '51',
      title: 'Название теста 5',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      isNew: false,
    ),
  ];

  @override
  Future<Iterable<Test>> getNewTests() async {
    await Future.delayed(const Duration(seconds: 2));
    return _data.where((it) => it.isNew);
  }

  @override
  Future<Iterable<Test>> getAllTests() async {
    final _old = _data.where((it) => !it.isNew);
    final _new = _data.where((it) => it.isNew);

    await Future.delayed(const Duration(seconds: 2));
    return [..._new, ..._old];
  }

  @override
  Future<Iterable<Test>> searchTests(String key) async {
    await Future.delayed(const Duration(seconds: 2));
    return _data.where((test) =>
    test.title.toLowerCase().contains(key.toLowerCase()) &&
        test.description.toLowerCase().contains(key.toLowerCase()));
  }

  Future<Test> getTestById(String id) async {
    return _data.firstWhere((test) => test.id == id);
  }

  @override
  Future<void> deleteTest(String id) async {
    _data.removeWhere((test) => test.id == id);
  }
}
