import 'package:intl/intl.dart';
import 'package:bekhterev_app/layers/models/domain/researches.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/researches.dart';

class ResearchesAdapter {
  Iterable<AvailableAppointment> createAvailableAppointments(
    Iterable<domain.AvailableAppointment> items,
  ) {
    return items.map(createAvailableAppointment);
  }

  AvailableAppointment createAvailableAppointment(domain.AvailableAppointment appointment) {
    final dateFormat = DateFormat("MMMM d HH:mm:ss");

    final from = dateFormat.format(appointment.startDateTime);
    final to = dateFormat.format(appointment.endDateTime);

    return AvailableAppointment(
      id: appointment.id,
      dateTime: '$from - $to',
    );
  }

  Iterable<Doctor> createDoctors(
    Iterable<domain.Doctor> items,
  ) {
    return items.map(createDoctor);
  }

  Doctor createDoctor(domain.Doctor doctor) {
    return Doctor(
      id: doctor.id,
      name: doctor.name,
    );
  }

  Iterable<Specialization> createSpecializations(
    Iterable<domain.Specialization> items,
  ) {
    return items.map(createSpecialization);
  }

  Specialization createSpecialization(domain.Specialization specialization) {
    return Specialization(
      id: specialization.id,
      name: specialization.name,
    );
  }

  Profile createProfile(domain.Profile profile) {
    return Profile(
      id: profile.id,
      name: profile.name.toString(),
      tel: profile.tel.toString(),
      telBase: profile.telBase.toString(),
    );
  }
}
