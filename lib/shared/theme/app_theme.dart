import 'package:flutter/material.dart';

class AppTheme {
  // Paleta kolorów 2025 - głębokie, subtelne odcienie z akcentami
  static const Color backgroundColor = Color(0xFF0A0A0A);
  static const Color surfaceColor = Color(0xFF121214);
  static const Color primaryColor = Color(0xFF1D1D22);
  static const Color accentColor = Color(0xFF2A2A36);
  static const Color accentColorAlt = Color(0xFF2D3142);
  static const Color neonAccent = Color(0xFF6E56CF);
  static const Color neonAccentAlt = Color(0xFF8866FF);
  static const Color textColor = Color(0xFFF8F8FC);
  static const Color secondaryTextColor = Color(0xFFB0B0C0);
  static const Color dividerColor = Color(0xFF252535);
  static const Color selectedItemColor = Color(0xFF2E2E42);
  static const Color cardColor = Color(0xFF18181F);
  static const Color shadowColor = Color(0x40000000);
  
  // Glassmorphism
  static List<BoxShadow> get neomorphicShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 15,
      offset: const Offset(5, 5),
    ),
    BoxShadow(
      color: const Color(0xFF25252E).withOpacity(0.3),
      blurRadius: 10,
      offset: const Offset(-3, -3),
    ),
  ];
  
  static BoxDecoration get glassmorphism => BoxDecoration(
    color: surfaceColor.withOpacity(0.7),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.white.withOpacity(0.1),
      width: 1.5,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 20,
        spreadRadius: -5,
      ),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.05),
      ],
    ),
  );
  
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(24),
    boxShadow: neomorphicShadow,
    border: Border.all(
      color: dividerColor.withOpacity(0.7),
      width: 1,
    ),
  );
  
  static BoxDecoration get selectedItemDecoration => BoxDecoration(
    color: selectedItemColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: neonAccent.withOpacity(0.15),
        blurRadius: 12,
        spreadRadius: -2,
      ),
    ],
    border: Border.all(
      color: neonAccent.withOpacity(0.3),
      width: 1.5,
    ),
  );

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: neonAccent,
        secondary: neonAccentAlt,
        surface: surfaceColor,
        surfaceTint: surfaceColor,
        surfaceContainerLowest: backgroundColor,
        onSurface: textColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: textColor, 
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        titleMedium: TextStyle(
          color: textColor,
          letterSpacing: -0.3,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          letterSpacing: -0.2,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          letterSpacing: -0.2,
        ),
        bodySmall: TextStyle(
          color: secondaryTextColor,
          letterSpacing: -0.1,
        ),
      ),
      iconTheme: const IconThemeData(color: textColor),
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
} 