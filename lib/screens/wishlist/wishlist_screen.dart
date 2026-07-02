import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: AppTextStyles.subHeading,
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: 4,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          crossAxisSpacing: 18,
          mainAxisSpacing: 18,

          childAspectRatio: 0.68,
        ),

        itemBuilder: (context, index) {

          return Container(
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius:
                  BorderRadius.circular(24),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),

                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                        ),

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(14),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Nike Air Max",
                        style:
                            AppTextStyles.subHeading
                                .copyWith(
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "\$240",
                        style:
                            AppTextStyles.body
                                .copyWith(
                          color: AppColors.primary,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}