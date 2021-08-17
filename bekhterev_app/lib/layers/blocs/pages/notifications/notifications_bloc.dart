import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/models/ui/notification.dart';
import 'package:bekhterev_app/layers/use_cases/notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsUseCase _useCase;

  NotificationsBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<NotificationsState> _onLoad() async* {
    try {
      yield LoadingState();
      final data = await _useCase.getNotifications();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }
}
