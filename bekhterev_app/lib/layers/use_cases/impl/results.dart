import 'package:bekhterev_app/adapters/ui/results.dart';
import 'package:bekhterev_app/layers/models/ui/results.dart';
import 'package:bekhterev_app/layers/services/results.dart';
import 'package:bekhterev_app/layers/use_cases/results.dart';

class ResultsUseCaseImpl implements ResultsUseCase {
  final ResultsService _resultsService;
  final ResultsAdapter _resultsAdapter;

  ResultsUseCaseImpl(
      this._resultsService,
      this._resultsAdapter,
      );

  @override
  Future<void> deleteResult(String id) => _resultsService.deleteResult(id);

  @override
  Future<Result> getDetailsById(String id) async {
    final result = await _resultsService.getResultById(id);
    return _resultsAdapter.createResult(result);
  }

  @override
  Future<Iterable<Result>> getResults() async {
    final result = await _resultsService.getResults();
    return result.map(_resultsAdapter.createResult);
  }

  @override
  Future<Iterable<Result>> searchResults(String key) async {
    final result = await _resultsService.searchResults(key);
    return result.map(_resultsAdapter.createResult);
  }
}
