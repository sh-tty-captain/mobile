import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/models/ui/profiles.dart';
import 'package:bekhterev_app/layers/use_cases/profiles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profiles_event.dart';
part 'profiles_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final ProfilesUseCase _useCase;

  ProfilesBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<ProfilesState> mapEventToState(ProfilesEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<ProfilesState> _onLoad() async* {
    try {
      yield LoadingState();
      final data = await _useCase.getProfile();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }
}
