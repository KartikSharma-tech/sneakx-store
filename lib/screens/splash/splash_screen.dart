import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_rounded,
              size: 90,
              color: AppColors.primary,
            ),

            const SizedBox(height: 20),

            Text(
              "SneakX",
              style: AppTextStyles.heading.copyWith(
                fontSize: 32,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Premium Fashion Store",
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}