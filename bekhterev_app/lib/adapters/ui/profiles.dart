import 'package:bekhterev_app/layers/models/domain/profiles.dart' as domain;
import 'package:bekhterev_app/layers/models/ui/profiles.dart';

class ProfilesAdapter {
  ProfileName createProfileName(domain.Profile profile) {
    return ProfileName(
      id: profile.id,
      name: profile.name.toUpperCase(),
    );
  }

  ProfileDetailed createProfileDetailed(domain.Profile profile) {
    return ProfileDetailed(
      id: profile.id,
      name: profile.name.toUpperCase(),
      tel: profile.tel.toString(),
    );
  }
}
