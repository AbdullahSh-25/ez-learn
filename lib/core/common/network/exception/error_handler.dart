import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:ez_learn/core/common/network/exception/app_exception.dart';

Future<Either<String, U>> throwAppException<U>(FutureOr Function() call) async {
  try {
    return Right(await call());
  } on AppException catch (e, s) {
    return Left(e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}

Future<T> throwDioException<T>(FutureOr<T> Function() call) async {
  try {
    return await call();
  } on DioError catch (e) {
    throw e.error;
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}