part of 'tests_bloc.dart';

abstract class TestsEvent extends Equatable {
  const TestsEvent();

  @override
  List<Object> get props => [];
}

class OnLoad extends TestsEvent {
}
