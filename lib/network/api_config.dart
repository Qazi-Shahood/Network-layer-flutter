
class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();

  late final String baseUrl;
  late final Duration timeoutDuration;

  ApiConfig._internal();

  factory ApiConfig() => _instance;

  void setup({
    required String baseUrl,
    required Duration timeOutDuration
  }) {
    this.baseUrl = baseUrl;
    timeoutDuration = timeOutDuration;
  }
}