part of 'researches_bloc.dart';

abstract class ResearchesState extends Equatable {
  const ResearchesState();
}

class LoadingState extends ResearchesState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends ResearchesState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends ResearchesState {
  final ResearchForm data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class LoadingUpdateFormState extends LoadedState {
  const LoadingUpdateFormState(ResearchForm data) : super(data);
}

class LoadingUpdateFormErrorState extends LoadedState {
  const LoadingUpdateFormErrorState(ResearchForm data) : super(data);
}
