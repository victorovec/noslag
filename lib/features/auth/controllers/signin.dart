import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final obscureTextProvider = StateProvider<bool>((ref) => true);

// Create a secure storage instance
final secureStorage = FlutterSecureStorage();

// This defines the login function that returns true or false
Future<bool> loginUser(String email, String password) async {
  final url = Uri.parse('$baseUrl/auth/login');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'companyEmail': email, 'password': password}),
  );

  print('Response: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    // ✅ Extract the token from the response
    final token = data['data']?['token'];

    // ✅ Save it securely if it exists
    if (token != null && token is String) {
      await secureStorage.write(key: 'auth_token', value: token);
      print('Token saved securely.');
      return true;
    } else {
      print('Token not found in response.');
      return false;
    }
  } else {
    print('Login failed with status: ${response.statusCode}');
    return false;
  }
}

// Create a StateNotifier to handle login state
class LoginNotifier extends StateNotifier<AsyncValue<bool>> {
  LoginNotifier() : super(const AsyncValue.data(false));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final success = await loginUser(email, password);
      if (success) {
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error('Invalid credentials', StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error('Failed to login: $e', StackTrace.current);
    }
  }
}

// Create provider
final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<bool>>(
  (ref) => LoginNotifier(),
);
