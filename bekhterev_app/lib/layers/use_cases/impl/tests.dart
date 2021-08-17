import 'package:bekhterev_app/adapters/ui/tests.dart';
import 'package:bekhterev_app/layers/models/ui/tests.dart';
import 'package:bekhterev_app/layers/services/tests.dart';
import 'package:bekhterev_app/layers/use_cases/tests.dart';

class TestsUseCaseImpl implements TestsUseCase {
  final TestsService _testsService;
  final TestsAdapter _testsAdapter;

  TestsUseCaseImpl(
      this._testsService,
      this._testsAdapter,
      );

  @override
  Future<void> deleteNotification(String id) => _testsService.deleteTest(id);

  @override
  Future<Tests> getTests() async {
    final newTests = await _testsService.getNewTests();
    final allTests = await _testsService.getAllTests();
    return _testsAdapter.createTests(newTests, allTests);
  }

  @override
  Future<Iterable<Test>> searchTests(String key) async {
    final tests = await _testsService.searchTests(key);
    return tests.map(_testsAdapter.createTest);
  }
}
