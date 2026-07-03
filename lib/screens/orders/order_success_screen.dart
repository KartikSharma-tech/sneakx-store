import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/bottom_nav_bar.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              Container(
                width: 140,
                height: 140,

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                "Order Placed Successfully 🎉",

                textAlign: TextAlign.center,

                style:
                    AppTextStyles.heading.copyWith(
                  fontSize: 30,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Your order will be delivered soon.",

                textAlign: TextAlign.center,

                style: AppTextStyles.body,
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  onPressed: () {

                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavBar(),
                      ),

                      (route) => false,
                    );
                  },

                  child: Text(
                    "Continue Shopping",

                    style:
                        AppTextStyles.button,
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