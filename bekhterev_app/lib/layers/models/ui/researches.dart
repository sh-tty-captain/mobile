import 'package:equatable/equatable.dart';

class ResearchForm {
  Profile? profile;
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

class Profile {
  final String id;
  final String name;
  final String tel;
  final String telBase;

  const Profile({
    required this.id,
    required this.name,
    required this.tel,
    required this.telBase,
  });
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

class ButtonSend {
  final bool isActive;

  const ButtonSend({
    required this.isActive,
  });
}
