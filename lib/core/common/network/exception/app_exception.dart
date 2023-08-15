class AppException implements Exception {
  final String message;

  final Exception innerException;

  AppException(this.message, this.innerException);

  factory AppException.unknown() => AppException(
      'try again', Exception());

  factory AppException.known(message) => AppException(message, Exception());

  @override
  String toString() => "message : $message, innerException: $innerException";
}