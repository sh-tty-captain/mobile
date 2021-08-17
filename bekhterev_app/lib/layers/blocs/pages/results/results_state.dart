part of 'results_bloc.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();
}

class LoadingState extends ResultsState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends ResultsState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends ResultsState {
  final Iterable<Result> data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
