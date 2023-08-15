import 'package:dio/dio.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/network/dio_client.dart';
import 'package:ez_learn/core/common/utils/storage_service.dart';
import 'package:ez_learn/core/constant/src/url.dart';
import 'package:ez_learn/features/auth/data/datasources/local/reactive_token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> generalInjection() async {
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  getIt.registerSingleton<StorageService<SharedStorage>>(
    StorageService.shared(
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerSingleton<ReactiveTokenStorage>(ReactiveTokenStorage(getIt<StorageService<SharedStorage>>()));

  getIt.registerSingleton<Dio>(
    DioClient("${AppUrl.baseUrlDevelopment}api/"),
  );
}