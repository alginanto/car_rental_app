import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dio_client.dart';

class AuthRepository {
  final DioClient _dioClient = DioClient();

  Future<String?> register(
      String email, String password, String name, String location) async {
    try {
      final response = await _dioClient.dio.post('/auth/register', data: {
        "email": email,
        "password": password,
        "name": name,
        "location": location
      });

      return response.data['token']; // Token received after registration
    } on DioException catch (e) {
      return Future.error(e.response?.data['message'] ?? "Registration failed");
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dioClient.dio.post('/auth/login', data: {
        "email": email,
        "password": password,
      });

      String token = response.data['token'];

      // Store token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return token;
    } on DioException catch (e) {
      return Future.error(e.response?.data['message'] ?? "Login failed");
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
    // New method to check if user is already logged in
  Future<String?> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
