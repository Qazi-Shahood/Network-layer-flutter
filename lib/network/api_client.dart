import 'package:dio/dio.dart';
import 'package:network_layer/network/api_config.dart';
import 'api_exception.dart';
import 'api_states.dart';
import 'result.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  final Dio _dio;

  factory ApiClient() => _instance;

  ApiClient._internal()
    : _dio = Dio(
         BaseOptions(
           baseUrl: ApiConfig().baseUrl,
           connectTimeout: ApiConfig().timeoutDuration,
           receiveTimeout: ApiConfig().timeoutDuration,
    ),
  ) {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Result<T>> get<T>(
      String path, {
        T Function(dynamic json)? decoder,
        Map<String, dynamic>? queryParamters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParamters);
      return Success(decoder != null ? decoder(response.data) : response.data);
    } on FormatException catch (e) {
      return Failure(SerializationException("Invalid JSON Format"));
    } on DioException catch (e) {
      return Failure(mapException(e));
    }
  }

  Future<Result<T>> post<T>(
      String path, {
        dynamic body,
        T Function(dynamic json)? decoder,
  }) async {
    try {
      final response = await _dio.post(path, data: body);
      return Success(decoder != null ? decoder(response.data) : response.data);
    } on DioException catch (e) {
      return Failure(mapException(e));
    }
  }

  ApiException mapException(DioException e) {
    final code = e.response?.statusCode;
    final message = e.response?.data?["message"].toString() ??
                     e.message ?? "Unexpected error";
    return switch (code) {
      400 => BadRequestException(message, statusCode: code),
      401 => UnauthorizedException(message, statusCode: code),
      500 || 501 || 502 => ServerException(message, statusCode: code),
      _ => UnknownException(message),
    };
  }

}