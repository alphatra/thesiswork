import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/shared/providers/app_state_provider.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';
import 'dart:ui' show ImageFilter;

class CustomTitleBar extends ConsumerWidget {
  const CustomTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWorkMode = ref.watch(workModeProvider);
    
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 64,
          color: AppTheme.backgroundColor.withOpacity(0.95),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.neonAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.bubble_chart_rounded,
                      color: AppTheme.neonAccent,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Thesiswork',
                    style: TextStyle(
                      color: AppTheme.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildWorkModeDropdown(context, ref, currentWorkMode),
                  const SizedBox(width: 16),
                  _buildUserProfileButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkModeDropdown(
    BuildContext context, 
    WidgetRef ref, 
    WorkMode currentWorkMode
  ) {
    return PopupMenuButton<WorkMode>(
      tooltip: 'Tryb pracy',
      offset: const Offset(0, 50),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppTheme.surfaceColor.withOpacity(0.9),
      onSelected: (WorkMode mode) {
        ref.read(appStateProvider.notifier).setWorkMode(mode);
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          title: 'Podstawowy',
          isSelected: currentWorkMode == WorkMode.podstawowy,
          value: WorkMode.podstawowy,
          icon: Icons.check_circle_outline_rounded,
        ),
        _buildPopupMenuItem(
          title: 'Eksperymentalny',
          isSelected: currentWorkMode == WorkMode.eksperymentalny,
          value: WorkMode.eksperymentalny,
          icon: Icons.science_rounded,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.accentColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppTheme.dividerColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              currentWorkMode == WorkMode.podstawowy 
                  ? Icons.check_circle_outline_rounded
                  : Icons.science_rounded,
              color: AppTheme.neonAccent,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              currentWorkMode == WorkMode.podstawowy 
                  ? 'Podstawowy' 
                  : 'Eksperymentalny',
              style: const TextStyle(
                color: AppTheme.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.keyboard_arrow_down_rounded, 
              color: AppTheme.textColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<WorkMode> _buildPopupMenuItem({
    required String title,
    required bool isSelected,
    required WorkMode value,
    required IconData icon,
  }) {
    return PopupMenuItem<WorkMode>(
      value: value,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.neonAccent : AppTheme.secondaryTextColor,
            size: 18,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? AppTheme.neonAccent : AppTheme.textColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          if (isSelected)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppTheme.neonAccent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.check, 
                color: AppTheme.neonAccent, 
                size: 14,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUserProfileButton(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Profil użytkownika',
      offset: const Offset(0, 50),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppTheme.surfaceColor.withOpacity(0.9),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        _buildUserMenuItem(
          title: 'Profil',
          icon: Icons.person_rounded,
          value: 'profile',
        ),
        _buildUserMenuItem(
          title: 'Ustawienia',
          icon: Icons.settings_rounded,
          value: 'settings',
        ),
        _buildUserMenuItem(
          title: 'Pomoc',
          icon: Icons.help_outline_rounded,
          value: 'help',
        ),
        const PopupMenuDivider(),
        _buildUserMenuItem(
          title: 'Wyloguj',
          icon: Icons.logout_rounded,
          value: 'logout',
          isDestructive: true,
        ),
      ],
      onSelected: (String value) {
        // Obsługa wybranej opcji
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.neonAccent.withOpacity(0.7),
              AppTheme.neonAccentAlt.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonAccent.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppTheme.accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_rounded,
            color: AppTheme.textColor,
            size: 20,
          ),
        ),
      ),
    );
  }
  
  PopupMenuItem<String> _buildUserMenuItem({
    required String title,
    required IconData icon,
    required String value,
    bool isDestructive = false,
  }) {
    final Color textColor = isDestructive 
        ? const Color(0xFFFF5370) 
        : AppTheme.textColor;
    
    return PopupMenuItem<String>(
      value: value,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon, 
            color: textColor, 
            size: 18,
          ),
          const SizedBox(width: 12),
          Text(
            title, 
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 