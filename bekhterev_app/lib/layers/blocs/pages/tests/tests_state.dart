part of 'tests_bloc.dart';

abstract class TestsState extends Equatable {
  const TestsState();
}

class LoadingState extends TestsState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends TestsState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends TestsState {
  final Tests data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
