import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/wishlist_provider.dart';
import 'providers/order_provider.dart';
import 'core/theme/app_theme.dart';
import 'screens/onboarding/onboarding_screen.dart';
// import 'screens/splash/splash_screen.dart';
// import 'screens/auth/login_screen.dart';
import 'widgets/bottom_nav_bar.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),

        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      
        ChangeNotifierProvider(create: (_) => OrderProvider()),
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

      home: const BottomNavBar(),
      //  " baad me remove krna h to show login screen also remove import of bottom nav bar and uncomment login screen import and home: const LoginScreen(),"
      // home: const OnboardingScreen(),

    );
  }
}
