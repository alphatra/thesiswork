import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/main.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';

void main() {
  testWidgets('App initializes correctly', (WidgetTester tester) async {
    // Zbuduj aplikację i wyzwól pojedynczą ramkę
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Zaczekaj na zakończenie animacji i asynchronicznych operacji
    await tester.pumpAndSettle();

    // Sprawdź, czy aplikacja została zainicjowana poprawnie
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('App has dark theme', (WidgetTester tester) async {
    // Zbuduj aplikację i wyzwól pojedynczą ramkę
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Zaczekaj na zakończenie animacji i asynchronicznych operacji
    await tester.pumpAndSettle();

    // Pobierz aktualny kontekst
    final BuildContext context = tester.element(find.byType(MaterialApp));
    
    // Sprawdź, czy temat to ciemny motyw
    final ThemeData theme = Theme.of(context);
    expect(theme.brightness, equals(Brightness.dark));
    
    // Sprawdź, czy kolor tła jest zgodny z oczekiwanym
    expect(
      theme.scaffoldBackgroundColor, 
      equals(AppTheme.backgroundColor),
    );
  });
} 