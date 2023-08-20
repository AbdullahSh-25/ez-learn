import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

// @freezed
class Result<T> with _$Result<T> {
  const factory Result.init() = _init<T>;

  const factory Result.loading() = _Lodaing<T>;

  const factory Result.loaded({required T data}) = _Loaded<T>;

  const factory Result.error({required String error}) = _Error<T>;
}

extension ResultExtension<T> on Result<T> {
  bool isLoading() => maybeWhen(orElse: () => false, loading: () => true);

  bool isLoaded() => maybeWhen(orElse: () => false, loaded: (data) => true);

  bool isInit() => maybeWhen(orElse: () => false, init: () => true);

  bool isError() => maybeWhen(orElse: () => false, error: (error) => true);

  T? getDataWhenSuccess() =>
      maybeWhen(orElse: () => null, loaded: (data) => data);
}