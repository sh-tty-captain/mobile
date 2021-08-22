import 'package:bekhterev_app/layers/models/ui/researches.dart';

abstract class ResearchesUseCase {
  Future<void> load();

  Future<ResearchForm> getResearchForm();

  Future<Profile> getProfile();

  Future<Specialization> getSpecialization();

  Future<void> selectSpecialization(String id);

  Future<void> selectDoctor(String id);

  Future<void> selectAppointmentTime(String id);
}
