import 'package:bekhterev_app/layers/models/ui/profiles.dart';

abstract class ProfilesUseCase {
  Future<ProfileDetailed> getProfile();
}
