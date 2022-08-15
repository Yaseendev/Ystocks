import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks_market/data/respositories/market_repository.dart';
import 'package:stocks_market/data/respositories/profile_repository.dart';
import 'package:stocks_market/utils/services/database_service.dart';
import 'routes.dart';
import 'services/network_api_service.dart';

final locator = GetIt.instance;

Future locatorsSetup() async{
  final prefs = await SharedPreferences.getInstance();
  final NetworkApiService networkApiService = NetworkApiService(Dio(BaseOptions(
      connectTimeout: 25000,
      receiveTimeout: 25000,
      contentType: 'application/json',
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      })));
  locator
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton<FluroRouter>(() {
      final router = FluroRouter();
      Routes.configureRoutes(router);
      return router;
    })
    ..registerLazySingleton<NetworkApiService>(() => networkApiService)
    ..registerLazySingleton<Connectivity>(() => Connectivity())
    ..registerLazySingleton<DatabaseService>(() => DatabaseService())
    ..registerLazySingleton<MarketRepository>(() => MarketRepository())
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepository());
}
