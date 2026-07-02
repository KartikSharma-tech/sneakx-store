import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {

  int selectedSize = 8;

  final List<int> sizes = [6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // TOP IMAGE
              Stack(
                children: [

                  Container(
                    height: 420,
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                        ),

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,

                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius:
                              BorderRadius.circular(16),
                        ),

                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    right: 20,

                    child: Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius:
                            BorderRadius.circular(16),
                      ),

                      child: const Icon(
                        Iconsax.heart,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    // NAME + PRICE
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        Expanded(
                          child: Text(
                            "Nike Air Max 270",
                            style:
                                AppTextStyles.heading.copyWith(
                              fontSize: 28,
                            ),
                          ),
                        ),

                        Text(
                          "\$240",
                          style:
                              AppTextStyles.subHeading.copyWith(
                            color: AppColors.primary,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // RATING
                    Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22,
                        ),

                        const SizedBox(width: 8),

                        Text(
                          "4.8 Rating",
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // SIZE TITLE
                    Text(
                      "Select Size",
                      style: AppTextStyles.subHeading,
                    ),

                    const SizedBox(height: 18),

                    // SIZE LIST
                    Row(
                      children: sizes.map((size) {

                        final bool isSelected =
                            selectedSize == size;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },

                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 14),

                            width: 55,
                            height: 55,

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.cardColor,

                              borderRadius:
                                  BorderRadius.circular(18),
                            ),

                            child: Center(
                              child: Text(
                                size.toString(),

                                style:
                                    AppTextStyles.subHeading
                                        .copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 30),

                    // DESCRIPTION
                    Text(
                      "Description",
                      style: AppTextStyles.subHeading,
                    ),

                    const SizedBox(height: 14),

                    Text(
                      "Experience premium comfort and modern streetwear style with the Nike Air Max 270. Designed for everyday wear with lightweight cushioning and bold aesthetics.",
                      style: AppTextStyles.body.copyWith(
                        height: 1.8,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // BUTTONS
                    Row(
                      children: [

                        Container(
                          width: 60,
                          height: 60,

                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius:
                                BorderRadius.circular(18),
                          ),

                          child: const Icon(
                            Iconsax.shopping_cart,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: SizedBox(
                            height: 60,

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

                              onPressed: () {},

                              child: Text(
                                "Buy Now",
                                style:
                                    AppTextStyles.button,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}