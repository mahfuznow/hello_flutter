
import 'package:hello_flutter/data/remote/api_client/api_client.dart';
import 'package:hello_flutter/domain/model/app_user_session.dart';

class MovieApiClient extends ApiClient {
  @override
  String get baseUrl => "https://yts.mx/api/v2";

  @override
  Future<Map<String, String>> getCustomHeader()  async {
    final accessToken = (await AppUserSession.example.getFromSharedPref() as AppUserSession).accessToken;
    return {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
  }
}