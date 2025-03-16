import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WorkMode {
  podstawowy,
  eksperymentalny,
}

class AppState {
  final bool isSidebarExpanded;
  final WorkMode workMode;

  const AppState({
    this.isSidebarExpanded = true,
    this.workMode = WorkMode.podstawowy,
  });

  AppState copyWith({
    bool? isSidebarExpanded,
    WorkMode? workMode,
  }) {
    return AppState(
      isSidebarExpanded: isSidebarExpanded ?? this.isSidebarExpanded,
      workMode: workMode ?? this.workMode,
    );
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState());

  void toggleSidebar() {
    state = state.copyWith(isSidebarExpanded: !state.isSidebarExpanded);
  }

  void setWorkMode(WorkMode mode) {
    state = state.copyWith(workMode: mode);
  }
}

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

final isSidebarExpandedProvider = Provider<bool>((ref) {
  return ref.watch(appStateProvider).isSidebarExpanded;
});

final workModeProvider = Provider<WorkMode>((ref) {
  return ref.watch(appStateProvider).workMode;
}); 