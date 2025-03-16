# Przewodnik dla współtwórców

Dziękujemy za zainteresowanie projektem Thesiswork! Cenimy wszystkie wkłady, od raportowania błędów po propozycje nowych funkcji, poprawki dokumentacji czy kodu.

## Proces rozwoju

Używamy GitHub Flow, co oznacza:

1. Główna gałąź `main` zawsze zawiera stabilny kod, gotowy do wydania
2. Praca nad nowymi funkcjami i poprawkami błędów odbywa się w oddzielnych gałęziach
3. Pull Requesty (PR) są używane do wprowadzania zmian do głównej gałęzi
4. Pull Requesty wymagają przeglądu kodu przed scaleniem

## Gałęzie

- `main`: Stabilny kod produkcyjny
- `dev`: Gałąź rozwojowa dla nowych funkcji
- `staging`: Gałąź przedprodukcyjna do testowania
- `feature/*`: Gałęzie dla konkretnych funkcji
- `fix/*`: Gałęzie dla poprawek błędów
- `release/*`: Gałęzie przygotowujące nową wersję

## Jak zgłaszać błędy

1. Użyj szablonu do zgłaszania błędów
2. Zawrzyj szczegółowe kroki do odtworzenia
3. Podaj informacje o swoim środowisku (system operacyjny, wersja aplikacji)
4. Jeśli to możliwe, dodaj zrzuty ekranu

## Jak sugerować nowe funkcje

1. Użyj szablonu do sugerowania nowych funkcji
2. Wyjaśnij, jaki problem rozwiązuje dana funkcja
3. Opisz oczekiwany wynik
4. Jeśli to możliwe, dołącz mockupy lub szkice UI

## Proces Pull Request

1. Upewnij się, że twoje zmiany są na oddzielnej gałęzi
2. Zaaktualizuj gałąź względem najnowszej wersji `dev` przed utworzeniem PR
3. Użyj szablonu PR dla swojego zgłoszenia
4. Upewnij się, że wszystkie testy przechodzą
5. Odpowiadaj na komentarze i sugestie recenzentów
6. Po zatwierdzeniu, twoje zmiany zostaną scalone przez opiekuna projektu

## Konwencje kodu

- Użyj Effective Dart style guide
- Wszystkie nazwy plików używają notacji snake_case
- Klasy, enumeracje i rozszerzenia używają notacji PascalCase
- Metody i zmienne używają notacji camelCase
- Formatuj kod przed przesłaniem (`dart format lib test`)
- Sprawdź analizę kodu przed przesłaniem (`flutter analyze`)

## Testowanie

- Staraj się dodawać testy do nowych funkcji
- Upewnij się, że wszystkie istniejące testy przechodzą przed wysłaniem PR
- Uruchamiaj testy lokalnie: `flutter test`

## Dokumentacja

- Komentuj kod zgodnie z dokumentacją Dartdoc
- Aktualizuj dokumentację przy wprowadzaniu zmian
- Dodawaj przykłady użycia, jeśli to możliwe

## Proces publikowania

Publikowanie nowych wersji jest zarządzane przez opiekunów projektu. Aby oznaczyć nowe wydanie:

1. Utwórz commit z wiadomością rozpoczynającą się od `release: vX.Y.Z`
2. System CI/CD automatycznie zbuduje aplikację dla wszystkich platform
3. Wydanie zostanie oznaczone tagiem i opublikowane na GitHub Releases

## Kontakt

Jeśli masz pytania lub potrzebujesz pomocy, możesz:
- Otworzyć problem (Issue) na GitHub
- Skontaktować się z głównym opiekunem: [@alphatra](https://github.com/alphatra)

Jeszcze raz dziękujemy za Twoje zaangażowanie! 