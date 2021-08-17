import 'package:bekhterev_app/adapters/domain/profiles.dart';
import 'package:bekhterev_app/layers/models/domain/profiles.dart';
import 'package:bekhterev_app/layers/services/api_gateway/api_gateway.dart';
import 'package:bekhterev_app/layers/services/profiles.dart';

class ProfilesServiceImpl implements ProfilesService {
  final ApiGateway _apiGateway;
  final ProfilesAdapter _profilesAdapter;

  ProfilesServiceImpl(this._apiGateway, this._profilesAdapter);

  @override
  Future<Profile> getProfile() async {
    final profile = await _apiGateway.getProfile();
    return _profilesAdapter.createProfile(profile);
  }
}
