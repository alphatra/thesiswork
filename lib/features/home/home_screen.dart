import 'package:flutter/material.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(),
            const SizedBox(height: 50),
            _buildWelcomeSection(),
            const SizedBox(height: 60),
            _buildInfoCard(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPageHeader() {
    return Row(
      children: [
        Container(
          width: 6,
          height: 28,
          decoration: BoxDecoration(
            color: AppTheme.neonAccent,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 14),
        const Text(
          'Strona Główna',
          style: TextStyle(
            color: AppTheme.textColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
  
  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Witaj w ',
              style: TextStyle(
                color: AppTheme.textColor,
                fontSize: 42,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
                height: 1.1,
              ),
            ),
            Transform.rotate(
              angle: -math.pi / 30, // Slight rotation for modern look
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.neonAccent,
                      AppTheme.neonAccentAlt,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neonAccent.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: const Text(
                  'Thesiswork',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppTheme.dividerColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.neonAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.touch_app_rounded,
                  color: AppTheme.neonAccent,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Wybierz sekcję z menu aby rozpocząć',
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildInfoCard() {
    return Expanded(
      child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: AppTheme.cardDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.neonAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.lightbulb_outline_rounded,
                  color: AppTheme.neonAccent,
                  size: 50,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Informacje o aplikacji',
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ta aplikacja została stworzona w ramach pracy magisterskiej i wykorzystuje zaawansowane narzędzia do analizy i wizualizacji danych.',
                style: TextStyle(
                  color: AppTheme.secondaryTextColor,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: -0.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
          'Dokumentacja',
          Icons.description_outlined,
          AppTheme.neonAccent.withOpacity(0.1),
          AppTheme.neonAccent,
        ),
        const SizedBox(width: 16),
        _buildButton(
          'Rozpocznij',
          Icons.play_arrow_rounded,
          AppTheme.neonAccent,
          Colors.white,
        ),
      ],
    );
  }
  
  Widget _buildButton(
    String text,
    IconData icon,
    Color backgroundColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: backgroundColor == AppTheme.neonAccent
            ? [
                BoxShadow(
                  color: AppTheme.neonAccent.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: -5,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
} 