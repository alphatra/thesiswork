# Thesiswork

![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart Version](https://img.shields.io/badge/Dart-3.x-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![CI/CD](https://github.com/alphatra/thesiswork/actions/workflows/ci.yml/badge.svg)

Nowoczesna aplikacja desktopowa dla systemu zarządzania danymi i raportami, stworzona w ramach pracy magisterskiej.

## Funkcje

- Zaawansowany, nowoczesny interfejs użytkownika w stylu trendu UI/UX 2025
- Ciemny motyw z akcentami neonowymi
- Zarządzanie i wizualizacja danych
- Generowanie raportów
- Tryby pracy: Podstawowy i Eksperymentalny
- Responsywny interfejs z możliwością chowania paska bocznego
- Efekty glassmorphism i neomorfizm

## Technologie

- **Flutter** - framework UI
- **Riverpod** - zarządzanie stanem
- **Window Manager** - zarządzanie oknem aplikacji
- **Flutter Hooks** - obsługa stanu w widgetach

## Architektura

Aplikacja została zaprojektowana zgodnie z zasadami Clean Architecture i zorganizowana według następującej struktury:

- `lib/features` - funkcjonalności pogrupowane tematycznie
- `lib/shared` - współdzielone komponenty i zasoby
  - `widgets` - wielokrotnie używane widgety
  - `providers` - dostawcy stanu (Riverpod)
  - `theme` - style i motywy aplikacji

## Uruchomienie projektu

### Wymagania

- Flutter SDK 3.x
- Dart SDK 3.x
- Git

### Instalacja

1. Sklonuj repozytorium:
   ```bash
   git clone https://github.com/alphatra/thesiswork.git
   ```

2. Przejdź do katalogu projektu:
   ```bash
   cd thesiswork
   ```

3. Pobierz zależności:
   ```bash
   flutter pub get
   ```

4. Uruchom aplikację:
   ```bash
   flutter run -d <platforma>
   ```
   gdzie `<platforma>` to jedna z dostępnych platform (windows, macos, linux)

## Rozwój projektu

### Konwencje kodu

- Używamy Effective Dart style guide
- Wszystkie nazwy plików używają notacji snake_case
- Klasy, enumeracje i rozszerzenia używają notacji PascalCase
- Metody i zmienne używają notacji camelCase

### Testowanie

```bash
flutter test
```

## Licencja

Ten projekt jest licencjonowany na warunkach licencji MIT - zobacz plik [LICENSE](LICENSE) dla szczegółów.

## Autor

- [@alphatra](https://github.com/alphatra)
