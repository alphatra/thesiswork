import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/features/auth/services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

final authStateProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref.read(authServiceProvider));
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthService _authService;
  
  AuthNotifier(this._authService) : super(false);

  Future<bool> login(String username, String password) async {
    final result = await _authService.login(username, password);
    state = result;
    return result;
  }
} 