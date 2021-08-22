import 'package:bekhterev_app/layers/models/domain/researches.dart';
import 'package:xml/xml.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResearchesAdapter {
  Iterable<Specialization> createSpecializations(XmlDocument response) {
    final list = _getElementByPath(
      response.rootElement,
      [
        'soap:Body',
        'm:GetSpesialityListResponse',
        'm:GetSpesialityListResult',
        'ListSpesiality',
      ],
    );

    final res = <Specialization>[];

    for (final element in list.children) {
      if (element is XmlElement) {
        res.add(_createSpecialization(element));
      }
    }

    return res;
  }

  Specialization _createSpecialization(XmlElement specialization) {
    final id = _getElementByPath(specialization, ['IdSpesiality']).innerText;
    final name = _getElementByPath(specialization, ['NameSpesiality']).innerText;

    return Specialization(
      id: id, name: name,
    );
  }

  Iterable<Doctor> createDoctors(XmlDocument response) {
    final list = _getElementByPath(
      response.rootElement,
      [
        'soap:Body',
        'm:GetDoctorListResponse',
        'm:GetDoctorListResult',
        'Docs',
      ],
    );

    final res = <Doctor>[];

    for (final element in list.children) {
      if (element is XmlElement) {
        res.add(_createDoctor(element));
      }
    }

    return res;
  }

  Doctor _createDoctor(XmlElement doctor) {
    final id = _getElementByPath(doctor, ['IdDoc']).innerText;
    final name = _getElementByPath(doctor, ['Name']).innerText;

    return Doctor(
      id: id, name: name,
    );
  }

  Iterable<AvailableAppointment> createAvaibleAppointments(XmlDocument response) {
    final list = _getElementByPath(
      response.rootElement,
      [
        'soap:Body',
        'm:GetAvaibleAppointmentsResponse',
        'm:GetAvaibleAppointmentsResult',
        'ListAppointments',
      ],
    );

    final res = <AvailableAppointment>[];

    for (final element in list.children) {
      if (element is XmlElement) {
        res.add(_createAvaibleAppointment(element));
      }
    }

    return res;

    // return list.children
    //     .where((it) => it is XmlElement)
    //     .map((it) => it as XmlElement)
    //     .map(_createAvaibleAppointment);
  }

  AvailableAppointment _createAvaibleAppointment(XmlElement appointment) {
    final id = _getElementByPath(appointment, ['IdAppointment']).innerText.toString();
    final visitStart = _getElementByPath(appointment, ['VisitStart']).innerText.toString();
    final visitEnd = _getElementByPath(appointment, ['VisitEnd']).innerText;

    final start = DateTime.parse(visitStart);
    final end = DateTime.parse(visitEnd);

    return AvailableAppointment(
        id: id, startDateTime: start, endDateTime: end);
  }

  XmlElement _getElementByPath(XmlElement rootElement, List<String> path) {
    XmlElement element = rootElement;

    for (final pathElement in path) {
      element = element.findAllElements(pathElement).first;
    }

    return element;
  }

  Future<Profile> createProfile(profile) async {
    final User user = FirebaseAuth.instance.currentUser!;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();

    Map<String, dynamic> data = querySnapshot as Map<String, dynamic>;

    final id = data['id'].toString();
    final name = data['name'].toString();
    final telBase = data['phone'].toString();
    final tel = user.phoneNumber.toString();

    return Profile(
      id: id,
      name: name,
      tel: tel,
      telBase: telBase,
    );
  }
}
