import 'package:bekhterev_app/layers/drivers/api/dio_client.dart';
import 'package:bekhterev_app/layers/drivers/session.dart';
import 'package:bekhterev_app/layers/services/api_gateway/api_gateway.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

import 'mock_data.dart';
import 'requests.dart' as requests;

class ApiGatewayImpl implements ApiGateway {
  late final DioClient _client;

  ApiGatewayImpl() {
    final dio = Dio();

    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );

    _client = DioClient(dio, baseEndpoint: 'http://85.143.164.226:8081');
  }

  @override
  Future<XmlDocument> getSpesialityList({Session? session}) async {
    if (kIsWeb) {
      return XmlDocument.parse(getSpesialityListResponse);
    } else {
      final response = await _client.post(
        '/InfoBase/ws/appointment',
        data: requests.spesialitySoap(),
        options: Options(
          headers: {
            "soapAction": "http://tempuri.org/#appointment:GetSpesialityList",
            "Content-Type": "text/xml; charset=utf-8",
            "cache-control": "no-cache",
          },
        ),
        session: session,
      );

      return XmlDocument.parse(response.data);
    }
  }

  @override
  Future<XmlDocument> getDoctorList(String specialityId, {Session? session}) async {
    if (kIsWeb) {
      return XmlDocument.parse(getDoctorListResponse);
    } else {
      final response = await _client.post(
        '/InfoBase/ws/appointment',
        data: requests.doctorSoap(specialityId),
        options: Options(
          headers: {
            "soapAction": "http://tempuri.org/#appointment:GetDoctorList",
            "Content-Type": "text/xml; charset=utf-8",
            "cache-control": "no-cache",
          },
        ),
        session: session,
      );

      return XmlDocument.parse(response.data);
    }
  }

  @override
  Future<XmlDocument> getAvaibleAppointmentsList(String doctorId, {Session? session}) async {
    if (kIsWeb) {
      return XmlDocument.parse(getAvailableAppointmentsResponse);
    } else {
      final response = await _client.post(
        '/InfoBase/ws/appointment',
        data: requests.availableAppointmentsSoap(doctorId),
        options: Options(
          headers: {
            "soapAction": "http://tempuri.org/#appointment:GetAvaibleAppointments",
            "Content-Type": "text/xml; charset=utf-8",
            "cache-control": "no-cache",
          },
        ),
        session: session,
      );

      return XmlDocument.parse(response.data);
    }
  }

  Future<XmlDocument> getProfile({Session? session}) async {
    return XmlDocument.parse(getProfileRepspose);
  }
}
