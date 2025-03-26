// Sprawdź czy ten plik istnieje i ma poprawną zawartość
class DevConfig {
  // Zawsze true dla celów developmentu
  static const bool isDevelopmentMode = true;
  
  // Dane do logowania deweloperskiego
  static const Map<String, String> devCredentials = {
    'username': 'admin',
    'password': 'admin',
  };
  
  // Timeout dla próby połączenia z backendem (w milisekundach)
  static const int backendConnectionTimeout = 5000;
} 