
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/network/error_interceptor.dart';
import 'package:ez_learn/core/common/network/localization_interceotor.dart';
import 'package:ez_learn/core/common/utils/storage_service.dart';
import 'package:ez_learn/core/constant/src/url.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/auth/data/datasources/local/reactive_token_storage.dart';
import 'package:ez_learn/features/auth/data/models/auth_model.dart';
import 'package:flutter/foundation.dart';

class DioClient with DioMixin implements Dio {
  late final local;

  DioClient(
    this.baseUrl, {
    List<Interceptor> interceptors = const [],
  }) {
    local = getIt<StorageService<SharedStorage>>();
    options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );
    transformer = FlutterTransformer();
    httpClientAdapter = DefaultHttpClientAdapter();
    options
      ..baseUrl = baseUrl
      ..headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Transfer-Encoding": "chunked"
      };
    if (interceptors.isNotEmpty) {
      this.interceptors.addAll(interceptors);
    }
    final logInterceptor = LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true,
    );
    final tokenDio = Dio(options)
      ..interceptors.addAll([
        logInterceptor,
      ]);
    this.interceptors.addAll([
      RefreshTokenInterceptor<AuthTokenModel>(
        debugLog: true,
        tokenProtocol: TokenProtocol(
          shouldRefresh: (response, token) {
            return response?.statusCode == 401;
          },
        ),
        // onRevoked: (dioError) {
        //   if (dioError.response!.statusCode == 403) {
        //     getIt<AuthRepository>().logout();
        //   }
        //   throw dioError;
        // },
        tokenStorage: getIt<ReactiveTokenStorage>(),
        tokenDio: tokenDio,
        refreshToken: (token, tokenDio) async {
          print('refresh');
          final response = await tokenDio.post('${AppUrl.baseUrlDevelopment}api/${AppUrl.refreshToken}', queryParameters: {
            'id': getIt<AuthLocal>().getUser()!.id,
            'refreshToken': token.refreshToken,
          });
          final authTokenModel = AuthTokenModel.fromMap(response.data);
          final authTokenModel2 = AuthTokenModel(
            accessToken: authTokenModel.accessToken,
            refreshToken: authTokenModel.refreshToken ?? token.refreshToken,
          );
          return authTokenModel2;
        },
      ),
      LocalizationInterceptor(),
      if (!kReleaseMode) logInterceptor,
      ErrorInterceptor(),
    ]);
  }

  final String baseUrl;
}
