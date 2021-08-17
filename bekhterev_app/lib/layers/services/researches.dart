import 'package:bekhterev_app/layers/models/domain/researches.dart';

abstract class ResearchesService {
  Future<Iterable<Specialization>> getSpecializations();

  Future<Iterable<Doctor>> getDoctorsBySpecializationId(String docId);

  Future<Iterable<AvailableAppointment>> getAvailableAppointmentsForDoctor(String id);
}
