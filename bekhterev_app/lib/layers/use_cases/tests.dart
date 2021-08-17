import 'package:bekhterev_app/layers/models/ui/tests.dart';

abstract class TestsUseCase {
  Future<Tests> getTests();

  Future<Iterable<Test>> searchTests(String key);

  Future<void> deleteNotification(String id);
}
