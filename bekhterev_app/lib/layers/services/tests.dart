import 'package:bekhterev_app/layers/models/domain/tests.dart';

abstract class TestsService {
  Future<Iterable<Test>> getNewTests();

  Future<Iterable<Test>> getAllTests();

  Future<Iterable<Test>> searchTests(String key);

  Future<Test> getTestById(String id);

  Future<void> deleteTest(String id);
}
