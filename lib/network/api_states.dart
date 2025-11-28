import 'package:network_layer/network/api_exception.dart';

sealed class ApiState<T> {
  const ApiState();
}

class ApiInitial<T> extends ApiState<T> {
  const ApiInitial();
}

class ApiLoading<T> extends ApiState<T> {
  const ApiLoading();
}

class ApiSuccess<T> extends ApiState<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiState<T> {
  final ApiException exception;
  const ApiFailure(this.exception);
}