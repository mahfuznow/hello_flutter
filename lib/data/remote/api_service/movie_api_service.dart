abstract class MovieApiService {
  Future<Map<String, dynamic>> getMovies();
  Future<Map<String, dynamic>> getMovieDetails(int movieId);
}
