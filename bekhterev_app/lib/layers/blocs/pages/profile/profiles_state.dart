part of 'profiles_bloc.dart';

abstract class ProfilesState extends Equatable {
  const ProfilesState();
}

class LoadingState extends ProfilesState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends ProfilesState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends ProfilesState {
  final ProfileDetailed data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
