import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';
import 'package:thesiswork/shared/widgets/app_layout.dart';
import 'package:window_manager/window_manager.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'shared/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Fullscreen immersive mode for mobile
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
  
  // Ustawienie przezroczystości dla paska statusu na urządzeniach mobilnych
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  
  // Inicjalizacja window_manager dla desktopowych środowisk
  await windowManager.ensureInitialized();
  
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1280, 800),
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden, // Ukryj domyślny pasek tytułowy
    title: 'Thesiswork',
    minimumSize: Size(800, 600),
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPreventClose(true); // Zapobiega przypadkowemu zamknięciu
    await windowManager.setSkipTaskbar(false);
    await windowManager.setHasShadow(true); // Dodaje cień do okna aplikacji
  });

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thesiswork',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      themeMode: ThemeMode.dark,
      home: const LoginScreen(),
    );
  }
}
