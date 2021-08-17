import 'package:bekhterev_app/layers/models/domain/results.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/results.dart';

class ResultsAdapter {
  Result createResult(domain.Result result) {
    return Result(
      id: result.id,
      title: result.title,
      date: result.date.toString(),
      shortDescription: result.shortDescription,
      fullDescription: result.fullDescription,
    );
  }
}
