import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'providers/wishlist_provider.dart';

import 'core/theme/app_theme.dart';

// import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';

// import 'screens/auth/login_screen.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              WishlistProvider(),
        ),
      ],

      child: const SneakXApp(),
    ),
  );
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