import 'package:bekhterev_app/layers/models/domain/error.dart';
import 'package:bekhterev_app/layers/models/ui/receipts.dart';
import 'package:bekhterev_app/layers/use_cases/receipts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'receipts_event.dart';
part 'receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  final ReceiptsUseCase _useCase;

  ReceiptsBloc(this._useCase) : super(const LoadingState());

  @override
  Stream<ReceiptsState> mapEventToState(ReceiptsEvent event) async* {
    if (event is OnLoad) {
      yield* _onLoad();
    } else {
      throw StateError('Unknown event: $event');
    }
  }

  Stream<ReceiptsState> _onLoad() async* {
    try {
      yield LoadingState();
      final data = await _useCase.getReceipts();
      yield LoadedState(data);
    } catch (e, stackTrace) {
      yield LoadingErrorState(AppError(e, stackTrace));
    }
  }
}
