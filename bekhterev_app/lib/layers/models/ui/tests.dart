class Tests {
  final Iterable<Test> newTests;
  final Iterable<Test> allTests;

  Tests({
    required this.newTests,
    required this.allTests,
  });
}

class Test {
  final String id;
  final String title;
  final String description;
  final bool isNew;

  const Test({
    required this.id,
    required this.title,
    required this.description,
    required this.isNew,
  });
}
