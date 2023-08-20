


import 'package:ez_learn/core/result_builder/result.dart';
import 'package:flutter/material.dart';

class ResultBuilder<T> extends StatelessWidget {
  const ResultBuilder({
    Key? key,
    required this.init,
    required this.success,
    required this.loading,
    required this.error,
    required this.result,
  }) : super(key: key);

  final Result<T> result;
  final Widget Function() init;
  final Widget Function() loading;
  final Widget Function(T data) success;
  final Widget Function(String message) error;

  @override
  Widget build(BuildContext context) {
    late final Widget next;
    result.when(
      init: () => next = init(),
      loading: () => next = loading(),
      loaded: (data) => next = success(data),
      error: (message) => next = error(message),
    );
    return next;
  }
}
