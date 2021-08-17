import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/models/ui/results.dart';
import 'package:bekhterev_app/layers/use_cases/results.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final ResultsUseCase _useCase;

  ResultsBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<ResultsState> mapEventToState(ResultsEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<ResultsState> _onLoad() async* {
    try {
      yield LoadingState();
      final data = await _useCase.getResults();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }
}
