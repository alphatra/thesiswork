import 'package:thesiswork/config/dev_config.dart';

class AuthService {
  // Symulacja sprawdzenia połączenia z backendem
  Future<bool> isBackendAvailable() async {
    if (!DevConfig.isDevelopmentMode) return true;
    
    // W trybie dev zawsze zwracamy false - symulując brak backendu
    return false;
  }

  // Metoda do logowania
  Future<bool> login(String username, String password) async {
    try {
      print('Próba logowania w trybie dev');
      print('Username: $username, Password: $password');
      
      // W trybie deweloperskim sprawdzamy tylko credentiale deweloperskie
      if (DevConfig.isDevelopmentMode) {
        final isDevLogin = username == DevConfig.devCredentials['username'] &&
                          password == DevConfig.devCredentials['password'];
        
        print('Wynik logowania dev: $isDevLogin');
        return isDevLogin;
      }
      
      // Tutaj możesz dodać właściwą implementację logowania
      return false;
      
    } catch (e) {
      print('Błąd podczas logowania: $e');
      return false;
    }
  }
} 