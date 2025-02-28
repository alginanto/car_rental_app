import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '${const String.fromEnvironment(
            'BASE_URL',
            defaultValue: 'http://192.168.1.113:8080',
          )}/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  DioClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Get token from SharedPreferences for each request
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('auth_token');

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        print(
            '🌐 REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}');
        print('HEADERS: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (error, handler) {
        print(
            '❌ ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.baseUrl}${error.requestOptions.path}');
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}
