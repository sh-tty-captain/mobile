import 'package:bekhterev_app/adapters/domain/researches.dart';
import 'package:bekhterev_app/layers/models/domain/researches.dart';
import 'package:bekhterev_app/layers/services/api_gateway/api_gateway.dart';
import 'package:bekhterev_app/layers/services/researches.dart';

class ResearchesServiceImpl implements ResearchesService {
  final ApiGateway _apiGateway;
  final ResearchesAdapter _adapter;

  ResearchesServiceImpl(this._apiGateway, this._adapter);

  @override
  Future<Iterable<AvailableAppointment>> getAvailableAppointmentsForDoctor(String docId) async {
    final appointments = await _apiGateway.getAvaibleAppointmentsList(docId);
    return _adapter.createAvaibleAppointments(appointments);
  }

  @override
  Future<Iterable<Doctor>> getDoctorsBySpecializationId(String id) async {
    final doctor = await _apiGateway.getDoctorList(id);
    return _adapter.createDoctors(doctor);
  }

  @override
  Future<Iterable<Specialization>> getSpecializations() async {
    final specialization = await _apiGateway.getSpesialityList();
    return _adapter.createSpecializations(specialization);
  }
}
