import 'package:bekhterev_app/layers/models/domain/profiles.dart';
import 'package:xml/xml.dart';

class ProfilesAdapter {
  Profile createProfile(XmlDocument profile) {
    final id =
        _getElementByPath(profile, ['m:GetProfileResponse', 'm:GetProfileResult', 'Profile', 'Id'])
            .innerText;
    final firstName = _getElementByPath(
        profile, ['m:GetProfileResponse', 'm:GetProfileResult', 'Profile', 'FirstName']).innerText;
    final lastName = _getElementByPath(
        profile, ['m:GetProfileResponse', 'm:GetProfileResult', 'Profile', 'LastName']).innerText;
    final patronymic = _getElementByPath(
        profile, ['m:GetProfileResponse', 'm:GetProfileResult', 'Profile', 'Patronymic']).innerText;
    final tel =
        _getElementByPath(profile, ['m:GetProfileResponse', 'm:GetProfileResult', 'Profile', 'Tel'])
            .innerText;
    return Profile(
      id: id,
      name: '$lastName $firstName $patronymic'.trim(),
      tel: tel,
    );
  }

  XmlElement _getElementByPath(
    XmlDocument doc,
    List<String> path,
  ) {
    XmlElement element = doc.rootElement.findAllElements('soap:Body').first;

    for (final pathElement in path) {
      element = element.findAllElements(pathElement).first;
    }

    return element;
  }
}
