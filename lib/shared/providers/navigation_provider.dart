import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationSection {
  home,
  data,
  reports,
  experimental,
}

class NavigationState {
  final NavigationSection currentSection;

  const NavigationState({
    this.currentSection = NavigationSection.home,
  });

  NavigationState copyWith({
    NavigationSection? currentSection,
  }) {
    return NavigationState(
      currentSection: currentSection ?? this.currentSection,
    );
  }
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(const NavigationState());

  void setCurrentSection(NavigationSection section) {
    state = state.copyWith(currentSection: section);
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});

final currentSectionProvider = Provider<NavigationSection>((ref) {
  return ref.watch(navigationProvider).currentSection;
}); 