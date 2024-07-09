import 'package:hello_flutter/data/remote/api_client/api_client.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/auth_repository_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/di/di_module.dart';
import 'package:hello_flutter/domain/repository/auth_repository.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';

class AppModule {
  AppModule._internal();

  static final AppModule _instance = AppModule._internal();

  factory AppModule() => _instance;

  final DiModule _diModule = DiModule();

  Future<void> injectDependencies() async {
    await injectApiClient();
    await injectApiService();
    await injectLocalDataService();
    await injectRepositories();
  }

  Future<void> removeDependencies() async {
    await removeApiClient();
    await removeApiService();
    await removeLocalDataService();
    await removeRepositories();
  }

  Future<void> injectApiClient() async {
    await _diModule.registerSingleton<ApiClient>(MovieApiClient());
  }

  Future<void> removeApiClient() async {
    await _diModule.unregisterSingleton<ApiClient>();
  }

  Future<void> injectApiService() async {
    final apiClient = await _diModule.resolve<ApiClient>();
    await _diModule.registerSingleton<MovieApiService>(
      MovieApiServiceImpl(apiClient: apiClient),
    );
  }

  Future<void> removeApiService() async {
    await _diModule.unregisterSingleton<MovieApiService>();
  }

  Future<void> injectLocalDataService() async {
    //TODO: Implement local service injection
  }

  Future<void> removeLocalDataService() async {}

  Future<void> injectRepositories() async {
    final movieApiService = await _diModule.resolve<MovieApiService>();
    await _diModule.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(movieApiService: movieApiService),
    );

    await _diModule.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  }

  Future<void> removeRepositories() async {
    await _diModule.unregisterSingleton<MovieRepository>();
  }
}
