import 'package:bekhterev_app/layers/models/domain/results.dart';

abstract class ResultsService {
  Future<Iterable<Result>> getResults();

  Future<Iterable<Result>> searchResults(String key);

  Future<Result> getResultById(String id);

  Future<void> deleteResult(String id);
}
