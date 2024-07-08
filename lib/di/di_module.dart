import 'package:hello_flutter/data/remote/api_client/api_client.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/di/di_container.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';
import 'package:hello_flutter/util/app_logger.dart';

class DiModule {
  static final DiModule _instance = DiModule._internal();

  factory DiModule() => _instance;

  DiModule._internal();

  Future<void> injectDependencies() async {
    await injectApiClient();
    await injectApiService();
    await injectLocalDataService();
    await injectRepositories();
  }

  Future<void> injectApiClient() async {
    await registerSingleton<ApiClient>(MovieApiClient());
  }

  Future<void> injectApiService() async {
    final apiClient = await resolve<ApiClient>();
    await registerSingleton<MovieApiService>(
        MovieApiServiceImpl(apiClient: apiClient));
  }

  Future<void> injectLocalDataService() async {
    //TODO: Implement local service injection
  }

  Future<void> injectRepositories() async {
    final movieApiService = await resolve<MovieApiService>();
    await registerSingleton<MovieRepository>(
      MovieRepositoryImpl(movieApiService: movieApiService),
    );
  }

  Future<void> registerSingleton<T>(T instance) async {
    try {
      await DiContainer().registerSingleton(instance);
    } catch (e) {
      AppLogger.e('Failed to register singleton $T: $e');
    }
  }

  Future<void> registerInstance<T>(T instance) async {
    try {
      await DiContainer().register(instance);
    } catch (e) {
      AppLogger.e('Failed to register instance $T: $e');
    }
  }

  Future<T> resolve<T>() async {
    try {
      return await DiContainer().resolve<T>();
    } catch (e) {
      AppLogger.e('Failed to resolve $T: $e');
      rethrow;
    }
  }
}
