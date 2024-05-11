import 'package:hello_flutter/data/remote/api_client.dart';

class MovieApiClient extends ApiClient {
  @override
  String get baseUrl => "https://api.themoviedb.org/3/";

}