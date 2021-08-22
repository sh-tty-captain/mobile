import 'package:bekhterev_app/layers/models/domain/results.dart';
import 'package:bekhterev_app/layers/services/results.dart';

class ResultsServiceImpl implements ResultsService {
  final _data = <Result>[
    Result(
      id: '1',
      title: 'Название результата 1',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
    ),
    Result(
      id: '2',
      title: 'Название результата 2',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
    ),
    Result(
      id: '3',
      title: 'Название результата 3',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
    ),
    Result(
      id: '4',
      title: 'Название результата 4',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
    ),
    Result(
      id: '5',
      title: 'Название результата 5',
      shortDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed lacus in arcu laoreet pretium.',
      fullDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      date: DateTime.now(),
    ),
  ];

  @override
  Future<Iterable<Result>> getResults() async {
    await Future.delayed(const Duration(seconds: 1));
    return _data;
  }

  @override
  Future<Iterable<Result>> searchResults(String key) async {
    await Future.delayed(const Duration(seconds: 1));
    return _data.where((result) =>
    result.title.toLowerCase().contains(key.toLowerCase()) &&
        result.fullDescription.toLowerCase().contains(key.toLowerCase()) &&
        result.shortDescription.toLowerCase().contains(key.toLowerCase()));
  }

  Future<Result> getResultById(String id) async {
    return _data.firstWhere((result) => result.id == id);
  }

  @override
  Future<void> deleteResult(String id) async {
    _data.removeWhere((result) => result.id == id);
  }
}
