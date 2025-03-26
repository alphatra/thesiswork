import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';

final dioProvider = Provider((ref) => Dio(BaseOptions(
      baseUrl: 'http://localhost:8082',
      contentType: 'application/json',
      validateStatus: (status) {
        return status! < 600; // Akceptuj wszystkie statusy, żeby zobaczyć pełną odpowiedź
      },
    )));

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(dioProvider));
});

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio _dio;

  AuthNotifier(this._dio) : super(AuthState());

  Future<void> register(String username, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      print('Wysyłam request rejestracji:');
      print('Dane: {"username": "$username", "email": "$email", "password": "$password"}');
      
      final response = await _dio.post(
        '/api/auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      
      print('Odpowiedź rejestracji: ${response.data}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        await login(username, password);
      }
    } catch (e) {
      print('Błąd podczas rejestracji: $e');
      state = state.copyWith(
        error: 'Wystąpił błąd podczas rejestracji. Spróbuj ponownie.',
        isLoading: false,
      );
    }
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      print('Wysyłam request logowania:');
      print('Dane: {"username": "$username", "password": "$password"}');
      
      final response = await _dio.post(
        '/api/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      
      print('Odpowiedź logowania: ${response.data}');
      
      if (response.statusCode == 200) {
        final authResponse = response.data;
        final user = User(
          id: authResponse['username'],
          email: authResponse['username'],
          name: authResponse['username'],
          avatarUrl: null,
        );
        state = state.copyWith(user: user, isLoading: false);
      }
    } catch (e) {
      print('Błąd logowania: $e');
      state = state.copyWith(
        error: 'Nieprawidłowa nazwa użytkownika lub hasło',
        isLoading: false,
      );
    }
  }

  void logout() {
    state = AuthState();
  }
} 