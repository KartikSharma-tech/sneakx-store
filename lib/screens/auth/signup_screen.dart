import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 30),

              Text(
                "Create Account 🚀",
                style: AppTextStyles.heading.copyWith(
                  fontSize: 30,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Sign up to start shopping",
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 40),

              // Name
              TextField(
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Full Name",

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Iconsax.user,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Email
              TextField(
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Email Address",

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Iconsax.sms,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Password",

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Iconsax.lock,
                    color: Colors.grey,
                  ),

                  suffixIcon: const Icon(
                    Iconsax.eye_slash,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Confirm Password
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Confirm Password",

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Iconsax.lock,
                    color: Colors.grey,
                  ),

                  suffixIcon: const Icon(
                    Iconsax.eye_slash,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: () {},

                  child: Text(
                    "Create Account",
                    style: AppTextStyles.button,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: AppTextStyles.body,

                    children: [
                      TextSpan(
                        text: "Login",
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}