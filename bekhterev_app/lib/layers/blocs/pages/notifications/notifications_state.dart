part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();
}

class LoadingState extends NotificationsState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingErrorState extends NotificationsState {
  final AppError error;

  const LoadingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends NotificationsState {
  final Iterable<NotificationInfo> data;

  const LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
