import 'package:hello_flutter/data/model/app_user_session.dart';
import 'package:hello_flutter/data/remote/api_client/api_client.dart';

class MovieApiClient extends ApiClient {
  @override
  String get baseUrl => "https://yts.mx/api/v2";

  @override
  String get bearerToken => (AppUserSession.example.getFromSharedPref() as AppUserSession).accessToken;
}