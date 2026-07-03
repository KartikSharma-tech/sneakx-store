import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
              const SizedBox(height: 40),

              Text(
                "Welcome Back 👋",
                style: AppTextStyles.heading.copyWith(fontSize: 32),
              ),

              const SizedBox(height: 10),

              Text("Login to continue shopping", style: AppTextStyles.body),

              const SizedBox(height: 50),

              // EMAIL
              TextField(
                controller: emailController,
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

              // PASSWORD
              TextField(
                obscureText: isPasswordHidden,
                controller: passwordController,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Password",

                  hintStyle: const TextStyle(color: Colors.grey),

                  prefixIcon: const Icon(Iconsax.lock, color: Colors.grey),

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },

                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),

                  filled: true,
                  fillColor: AppColors.cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerRight,

                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.body.copyWith(color: AppColors.primary),
                ),
              ),

              const SizedBox(height: 40),

              // LOGIN BUTTON
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

  if (emailController.text.isEmpty ||
      passwordController.text.isEmpty) {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          "Please fill email and password",
        ),
      ),
    );

    return;
  }

  Navigator.push(

    context,

    MaterialPageRoute(

      builder: (context) =>
          const BottomNavBar(),

    ),
  );
},

                  child: Text("Login", style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 30),

              Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
