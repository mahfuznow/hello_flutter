import 'package:hello_flutter/data/local/shared_preference/entity/user_session_shared_preference_entity.dart';
import 'package:hello_flutter/data/remote/api_client/api_client.dart';

class MovieApiClient extends ApiClient {
  @override
  String get baseUrl => "https://yts.mx/api/v2";

  @override
  Future<Map<String, String>> getCustomHeader() async {
    final accessToken = (await UserSessionSharedPreferenceEntity.example
        .getFromSharedPref() as UserSessionSharedPreferenceEntity)
        .accessToken;
    return {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
  }
}
