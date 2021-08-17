part of 'researches_bloc.dart';

abstract class ResearchesEvent extends Equatable {
  const ResearchesEvent();
}

class OnLoad extends ResearchesEvent {
  @override
  List<Object> get props => [];
}

class OnSelectSpecialization extends ResearchesEvent {
  final String id;

  const OnSelectSpecialization(this.id);

  @override
  List<Object> get props => [id];
}

class OnSelectDoctor extends ResearchesEvent {
  final String id;

  const OnSelectDoctor(this.id);

  @override
  List<Object> get props => [id];
}

class OnSelectAppointmentTime extends ResearchesEvent {
  final String id;

  const OnSelectAppointmentTime(this.id);

  @override
  List<Object> get props => [id];
}
