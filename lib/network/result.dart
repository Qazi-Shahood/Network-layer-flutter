import 'package:network_layer/network/api_exception.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final ApiException exception;
  const Failure(this.exception);
}