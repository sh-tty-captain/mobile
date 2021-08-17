import 'package:bekhterev_app/adapters/ui/profiles.dart';
import 'package:bekhterev_app/layers/models/ui/profiles.dart';
import 'package:bekhterev_app/layers/services/profiles.dart';
import 'package:bekhterev_app/layers/use_cases/profiles.dart';

class ProfilesUseCaseImpl implements ProfilesUseCase {
  final ProfilesService _profilesService;
  final ProfilesAdapter _profilesAdapter;

  ProfilesUseCaseImpl(
    this._profilesService,
    this._profilesAdapter,
  );

  @override
  Future<ProfileDetailed> getProfile() async {
    final profile = await _profilesService.getProfile();
    return _profilesAdapter.createProfileDetailed(profile);
  }
}
