import 'package:bekhterev_app/adapters/ui/researches.dart';
import 'package:bekhterev_app/layers/models/ui/researches.dart';
import 'package:bekhterev_app/layers/services/researches.dart';
import 'package:bekhterev_app/layers/use_cases/researches.dart';

class ResearchesUseCaseImpl implements ResearchesUseCase {
  final ResearchesService _researchesService;
  final ResearchesAdapter _researchesAdapter;

  final _form = ResearchForm();
  final _formRequest = ResearchFormRequest();

  ResearchesUseCaseImpl(
    this._researchesService,
    this._researchesAdapter,
  );

  @override
  Future<void> load() async {
    final specializations = await _researchesService.getSpecializations();
    _form.specializations = _researchesAdapter.createSpecializations(specializations);
  }

  @override
  Future<Profile> getProfile() async {
    final profile = await _researchesService.getProfile();
    return _researchesAdapter.createProfile(profile);
  }

  @override
  Future<ResearchForm> getResearchForm() async {
    return _form;
  }

  @override
  Future<Specialization> getSpecialization() async {
    return _form.specializations.single;
  }

  @override
  Future<void> selectSpecialization(String id) async {
    final doctors = await _researchesService.getDoctorsBySpecializationId(id);
    await Future.delayed(Duration(milliseconds: 1000));
    _form.doctors = _researchesAdapter.createDoctors(doctors);
    _form.selectedSpecialization = _form.specializations.firstWhere((element) => element.id == id);
    _formRequest.specializationId = id;
  }

  @override
  Future<void> selectDoctor(String id) async {
    final availableAppointments = await _researchesService.getAvailableAppointmentsForDoctor(id);
    _form.availableAppointments =
        _researchesAdapter.createAvailableAppointments(availableAppointments);
  }

  @override
  Future<void> selectAppointmentTime(String id) async {
    _form.activeButton = ButtonSend(isActive: true);
  }
}
