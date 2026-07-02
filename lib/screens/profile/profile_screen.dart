import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          "My Profile",
          style: AppTextStyles.subHeading,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // PROFILE IMAGE
            Container(
              width: 120,
              height: 120,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 3,
                ),

                image: const DecorationImage(
                  image: NetworkImage(
                    "https://i.pravatar.cc/300",
                  ),

                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Kartik Sharma",
              style: AppTextStyles.heading.copyWith(
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Flutter Developer",
              style: AppTextStyles.body.copyWith(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),

            buildTile(
              icon: Iconsax.user,
              title: "Edit Profile",
            ),

            buildTile(
              icon: Iconsax.location,
              title: "Shipping Address",
            ),

            buildTile(
              icon: Iconsax.card,
              title: "Payment Methods",
            ),

            buildTile(
              icon: Iconsax.notification,
              title: "Notifications",
            ),

            buildTile(
              icon: Iconsax.setting,
              title: "Settings",
            ),

            buildTile(
              icon: Iconsax.logout,
              title: "Logout",
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile({
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(
              icon,
              color: isLogout
                  ? Colors.red
                  : AppColors.primary,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.subHeading.copyWith(
                fontSize: 16,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ],
      ),
    );
  }
}