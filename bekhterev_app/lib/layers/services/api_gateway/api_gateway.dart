import 'package:bekhterev_app/layers/drivers/session.dart';
import 'package:xml/xml.dart';

abstract class ApiGateway {
  Future<XmlDocument> getSpesialityList({Session? session});

  Future<XmlDocument> getDoctorList(String specialityId, {Session? session});

  Future<XmlDocument> getAvaibleAppointmentsList(String doctorId, {Session? session});

  Future<XmlDocument> getProfile({Session? session});
}
