import 'package:equatable/equatable.dart';

class ResearchForm {
  Iterable<Specialization> specializations = const [];
  Iterable<Doctor> doctors = const [];
  Iterable<AvailableAppointment> availableAppointments = const [];
  Specialization? selectedSpecialization;
  ButtonSend? activeButton;
}

class ResearchFormRequest {
  String? specializationId;
  String? doctorId;
  String? appointmentId;
}

class AvailableAppointment extends Equatable {
  final String id;
  final String dateTime;

  const AvailableAppointment({
    required this.id,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [id, dateTime];
}

class Doctor extends Equatable {
  final String id;
  final String name;

  const Doctor({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class Specialization extends Equatable {
  final String id;
  final String name;

  const Specialization({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class ButtonSend {
  final bool isActive;

  const ButtonSend({
    required this.isActive,
  });
}
