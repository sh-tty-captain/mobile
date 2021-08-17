part of 'receipts_bloc.dart';


abstract class ReceiptsState extends Equatable {
  const ReceiptsState();
}

class LoadingState extends ReceiptsState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends ReceiptsState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends ReceiptsState {
  final Receipts data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
