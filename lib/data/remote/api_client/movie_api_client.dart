import 'package:hello_flutter/data/remote/api_client/api_client.dart';

class MovieApiClient extends ApiClient {
  @override
  String get baseUrl => "https://yts.mx/api/v2";

}