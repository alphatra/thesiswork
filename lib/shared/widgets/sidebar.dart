import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/shared/providers/app_state_provider.dart';
import 'package:thesiswork/shared/providers/navigation_provider.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';
import 'dart:ui' show ImageFilter;

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSidebarExpanded = ref.watch(isSidebarExpandedProvider);
    final currentSection = ref.watch(currentSectionProvider);
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      width: isSidebarExpanded ? 270 : 80,
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(1, 0),
          ),
        ],
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            children: [
              // Logo section
              Container(
                height: 70,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.neonAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.neonAccent.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.bubble_chart_rounded,
                        color: AppTheme.neonAccent,
                        size: 22,
                      ),
                    ),
                    if (isSidebarExpanded) ...[
                      const SizedBox(width: 16),
                      const Text(
                        'Thesiswork',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.dividerColor.withOpacity(0.01),
                      AppTheme.dividerColor.withOpacity(0.8),
                      AppTheme.dividerColor.withOpacity(0.01),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Navigation header
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSidebarExpanded ? 24 : 12,
                ),
                child: Row(
                  children: [
                    if (isSidebarExpanded)
                      const Text(
                        'NAWIGACJA',
                        style: TextStyle(
                          color: AppTheme.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      )
                    else
                      Container(
                        height: 4,
                        width: 24,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryTextColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Navigation items
              _buildNavItem(
                context,
                ref,
                NavigationSection.home,
                Icons.home_rounded,
                'Strona Główna',
                currentSection,
                isSidebarExpanded,
              ),
              _buildNavItem(
                context,
                ref,
                NavigationSection.data,
                Icons.data_array_rounded,
                'Dane',
                currentSection,
                isSidebarExpanded,
              ),
              _buildNavItem(
                context,
                ref,
                NavigationSection.reports,
                Icons.insert_chart_rounded,
                'Raporty',
                currentSection,
                isSidebarExpanded,
              ),
              _buildNavItem(
                context,
                ref,
                NavigationSection.experimental,
                Icons.science_rounded,
                'Eksperymentalne',
                currentSection,
                isSidebarExpanded,
              ),
              
              const Spacer(),
              
              // Toggle sidebar button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    ref.read(appStateProvider.notifier).toggleSidebar();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppTheme.dividerColor,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: isSidebarExpanded 
                          ? MainAxisAlignment.center 
                          : MainAxisAlignment.center,
                      children: [
                        if (isSidebarExpanded) ...[
                          const SizedBox(width: 8),
                          const Text(
                            'Zwiń menu',
                            style: TextStyle(
                              color: AppTheme.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Icon(
                          isSidebarExpanded 
                              ? Icons.chevron_left_rounded
                              : Icons.chevron_right_rounded,
                          color: AppTheme.textColor,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    WidgetRef ref,
    NavigationSection section,
    IconData icon,
    String title,
    NavigationSection currentSection,
    bool isSidebarExpanded,
  ) {
    final isSelected = section == currentSection;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ref.read(navigationProvider.notifier).setCurrentSection(section);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          height: 54,
          width: double.infinity,
          decoration: isSelected
              ? AppTheme.selectedItemDecoration
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
                ),
          padding: EdgeInsets.symmetric(
            horizontal: isSidebarExpanded ? 16 : 0,
          ),
          child: Row(
            mainAxisAlignment: 
                isSidebarExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: isSelected
                    ? BoxDecoration(
                        color: AppTheme.neonAccent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      )
                    : null,
                child: Icon(
                  icon,
                  color: isSelected 
                      ? AppTheme.neonAccent 
                      : AppTheme.secondaryTextColor,
                  size: 22,
                ),
              ),
              if (isSidebarExpanded) ...[
                const SizedBox(width: 14),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected 
                        ? AppTheme.textColor 
                        : AppTheme.secondaryTextColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 