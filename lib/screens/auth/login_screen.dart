import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'signup_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/bottom_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

     body: SafeArea(
  child: SingleChildScrollView(
    child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 40),

              Text(
                "Welcome Back 👋",
                style: AppTextStyles.heading.copyWith(fontSize: 32),
              ),

              const SizedBox(height: 10),

              Text("Login to continue shopping", style: AppTextStyles.body),

              const SizedBox(height: 50),

              // Email Field
              TextField(
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: const TextStyle(color: Colors.grey),

                  prefixIcon: const Icon(Iconsax.sms, color: Colors.grey),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password Field
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),

                  prefixIcon: const Icon(Iconsax.lock, color: Colors.grey),

                  suffixIcon: const Icon(Iconsax.eye_slash, color: Colors.grey),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,

                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.body.copyWith(color: AppColors.primary),
                ),
              ),

              const SizedBox(height: 40),

              // Login Button
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

                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    );
                  },

                  child: Text("Login", style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade800)),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    child: Text("OR", style: AppTextStyles.body),
                  ),

                  Expanded(child: Divider(color: Colors.grey.shade800)),
                ],
              ),

              const SizedBox(height: 30),

              // Google Button
              Container(
                width: double.infinity,
                height: 58,

                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Icon(
                      Icons.g_mobiledata,
                      color: Colors.white,
                      size: 34,
                    ),

                    const SizedBox(width: 10),

                    Text("Continue with Google", style: AppTextStyles.button),
                  ],
                ),
              ),

              const Spacer(),

              Center(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },

                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppTextStyles.body,

                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),),
      ),
    );
  }
}
