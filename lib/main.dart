import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
// import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const SneakXApp());
}

class SneakXApp extends StatelessWidget {
  const SneakXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.darkTheme,

      home: const OnboardingScreen(),
    );
  }
}