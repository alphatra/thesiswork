import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/shared/providers/app_state_provider.dart';

void main() {
  group('AppStateNotifier', () {
    test('initial state has sidebar expanded and default work mode', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Sprawdź stan początkowy
      final appState = container.read(appStateProvider);
      expect(appState.isSidebarExpanded, isTrue);
      expect(appState.workMode, equals(WorkMode.podstawowy));
    });

    test('toggleSidebar changes sidebar state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Sprawdź stan początkowy
      expect(container.read(appStateProvider).isSidebarExpanded, isTrue);

      // Wywołaj metodę toggleSidebar
      container.read(appStateProvider.notifier).toggleSidebar();

      // Sprawdź, czy stan został zmieniony
      expect(container.read(appStateProvider).isSidebarExpanded, isFalse);

      // Wywołaj metodę toggleSidebar ponownie
      container.read(appStateProvider.notifier).toggleSidebar();

      // Sprawdź, czy stan został przywrócony
      expect(container.read(appStateProvider).isSidebarExpanded, isTrue);
    });

    test('setWorkMode changes work mode', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Sprawdź stan początkowy
      expect(container.read(appStateProvider).workMode, equals(WorkMode.podstawowy));

      // Zmień tryb pracy
      container.read(appStateProvider.notifier).setWorkMode(WorkMode.eksperymentalny);

      // Sprawdź, czy tryb pracy został zmieniony
      expect(container.read(appStateProvider).workMode, equals(WorkMode.eksperymentalny));
    });
  });

  group('AppState providers', () {
    test('isSidebarExpandedProvider returns correct value', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Sprawdź stan początkowy
      expect(container.read(isSidebarExpandedProvider), isTrue);

      // Zmień stan
      container.read(appStateProvider.notifier).toggleSidebar();

      // Sprawdź, czy provider zwraca nową wartość
      expect(container.read(isSidebarExpandedProvider), isFalse);
    });

    test('workModeProvider returns correct value', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Sprawdź stan początkowy
      expect(container.read(workModeProvider), equals(WorkMode.podstawowy));

      // Zmień tryb pracy
      container.read(appStateProvider.notifier).setWorkMode(WorkMode.eksperymentalny);

      // Sprawdź, czy provider zwraca nową wartość
      expect(container.read(workModeProvider), equals(WorkMode.eksperymentalny));
    });
  });
} 