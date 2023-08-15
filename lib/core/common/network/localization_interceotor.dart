import 'package:dio/dio.dart';

class LocalizationInterceptor extends Interceptor {

  LocalizationInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers.addAll({'lang': 'ar'});
    handler.next(options);
  }
}