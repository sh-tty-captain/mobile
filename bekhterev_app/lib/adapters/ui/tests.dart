import 'package:bekhterev_app/layers/models/domain/tests.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/tests.dart';

class TestsAdapter {
  Tests createTests(
    Iterable<domain.Test> newTests,
    Iterable<domain.Test> allTests,
  ) {
    return Tests(
      newTests: newTests.map(createTest),
      allTests: allTests.map(createTest),
    );
  }

  Test createTest(domain.Test test) {
    return Test(
      id: test.id,
      title: test.title.toUpperCase(),
      description: test.description,
      isNew: test.isNew,
    );
  }
}
