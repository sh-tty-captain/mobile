import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/models/ui/tests.dart';
import 'package:bekhterev_app/layers/use_cases/tests.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tests_event.dart';
part 'tests_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsUseCase _useCase;

  TestsBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<TestsState> mapEventToState(TestsEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<TestsState> _onLoad() async* {
    try {
      yield LoadingState();
      final data = await _useCase.getTests();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }
}
