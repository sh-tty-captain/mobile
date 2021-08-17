import 'package:bekhterev_app/layers/models/ui/researches.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/use_cases/researches.dart';

part 'researches_event.dart';
part 'researches_state.dart';

class ResearchesBloc extends Bloc<ResearchesEvent, ResearchesState> {
  final ResearchesUseCase _useCase;

  ResearchesBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<ResearchesState> mapEventToState(ResearchesEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else if (event is OnSelectSpecialization) {
      yield* _onSelectSpecialization(event);
    } else if (event is OnSelectDoctor) {
      yield* _onSelectDoctor(event);
    } else if (event is OnSelectAppointmentTime) {
      yield* _onSelectAppointmentTime(event);
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<ResearchesState> _onLoad() async* {
    try {
      yield LoadingState();
      await _useCase.load();
      final data = await _useCase.getResearchForm();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }

  Stream<ResearchesState> _onSelectSpecialization(
      OnSelectSpecialization event) async* {
    assert(state is LoadedState);
    final currentState = state as LoadedState;

    try {
      yield LoadingUpdateFormState(currentState.data);
      await _useCase.selectSpecialization(event.id);
      final data = await _useCase.getResearchForm();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());

      yield LoadingUpdateFormErrorState(currentState.data);
      // _errorsService.pushError(Error(e, stackTrace));
    }
  }

  Stream<ResearchesState> _onSelectDoctor(OnSelectDoctor event) async* {
    assert(state is LoadedState);
    final currentState = state as LoadedState;

    try {
      yield LoadingUpdateFormState(currentState.data);
      await _useCase.selectDoctor(event.id);
      final data = await _useCase.getResearchForm();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());

      yield LoadingUpdateFormErrorState(currentState.data);
      // _errorsService.pushError(Error(e, stackTrace));
    }
  }

  Stream<ResearchesState> _onSelectAppointmentTime(OnSelectAppointmentTime event) async* {
    assert(state is LoadedState);
    final currentState = state as LoadedState;

    try {
      yield LoadingUpdateFormState(currentState.data);
      await _useCase.selectAppointmentTime(event.id);
      final data = await _useCase.getResearchForm();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());

      yield LoadingUpdateFormErrorState(currentState.data);
      // _errorsService.pushError(Error(e, stackTrace));
    }
  }
}
