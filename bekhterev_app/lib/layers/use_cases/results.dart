import 'package:bekhterev_app/layers/models/ui/results.dart';

abstract class ResultsUseCase {
  Future<Iterable<Result>> getResults();

  Future<Iterable<Result>> searchResults(String key);

  Future<Result> getDetailsById(String id);

  Future<void> deleteResult(String id);
}
