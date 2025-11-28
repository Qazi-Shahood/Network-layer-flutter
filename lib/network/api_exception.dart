
abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => '$message with code: $statusCode';
}

class BadRequestException extends ApiException {
  BadRequestException(super.message, {super.statusCode});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message, {super.statusCode});
}

class SerializationException extends ApiException {
  SerializationException(super.message, {super.statusCode});
}

class ServerException extends ApiException {
  ServerException(super.message, {super.statusCode});
}

class TimeOutException extends ApiException {
  TimeOutException(super.message);
}

class UnknownException extends ApiException {
  UnknownException(super.message);
}