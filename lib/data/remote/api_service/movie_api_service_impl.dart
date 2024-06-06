import 'package:hello_flutter/data/remote/api_client/api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';

class MovieApiServiceImpl implements MovieApiService {
  ApiClient apiClient;

  MovieApiServiceImpl(this.apiClient);

  @override
  Future<Map<String, dynamic>> getMovies() async {
    return apiClient.get("/list_movies.json");
  }

  @override
  Future<Map<String, dynamic>> getMovieDetails(int movieId) {
    return apiClient.get(
      "/movie_details.json",
      queryParameters: {"movie_id": movieId},
    );
  }
}
