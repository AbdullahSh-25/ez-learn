import 'dart:core';

enum _Status { initial, loading, success, fail, none }

class BlocStatus {
  final _Status status;

  ///Example
  ///
  ///class   _____State {
  /// final   BlocStatusN _____Status;
  /// final   BlocStatusN _____Status;
  ///
  /// const  NotificationState({ this.____Status=const  BlocStatusN(),
  ///      this._____Status=const BlocStatusN()});

  const BlocStatus._({this.status = _Status.initial}) : error = null;
  final String? error;

  const BlocStatus.loading()
      : status = _Status.loading,
        error = null;

  const BlocStatus.success()
      : status = _Status.success,
        error = null;

  const BlocStatus.fail({required this.error}) : status = _Status.fail;

  const BlocStatus.initial()
      : status = _Status.initial,
        error = null;

  bool isLoading() => status == _Status.loading;

  bool isInitial() => status == _Status.initial;

  bool isFail() => status == _Status.fail;

  bool isSuccess() => status == _Status.success;
}
