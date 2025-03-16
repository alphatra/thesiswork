import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/features/data/data_screen.dart';
import 'package:thesiswork/features/experimental/experimental_screen.dart';
import 'package:thesiswork/features/home/home_screen.dart';
import 'package:thesiswork/features/reports/reports_screen.dart';
import 'package:thesiswork/shared/providers/navigation_provider.dart';

class ContentContainer extends ConsumerWidget {
  const ContentContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSection = ref.watch(currentSectionProvider);
    
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _getScreenForSection(currentSection),
    );
  }

  Widget _getScreenForSection(NavigationSection section) {
    switch (section) {
      case NavigationSection.home:
        return const HomeScreen();
      case NavigationSection.data:
        return const DataScreen();
      case NavigationSection.reports:
        return const ReportsScreen();
      case NavigationSection.experimental:
        return const ExperimentalScreen();
      default:
        return const HomeScreen();
    }
  }
} 