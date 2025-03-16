import 'package:flutter/material.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';

class ExperimentalScreen extends StatelessWidget {
  const ExperimentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Eksperymentalne',
              style: TextStyle(
                color: AppTheme.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.science,
                        color: AppTheme.textColor,
                        size: 48,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Sekcja Eksperymentalne',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Tutaj znajdą się eksperymentalne funkcje aplikacji.',
                        style: TextStyle(
                          color: AppTheme.secondaryTextColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 