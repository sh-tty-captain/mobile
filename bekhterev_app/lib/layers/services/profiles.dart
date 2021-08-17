import 'package:bekhterev_app/layers/models/domain/profiles.dart';

abstract class ProfilesService {
  Future<Profile> getProfile();
}
