import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: Text("My Cart", style: AppTextStyles.subHeading)),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<CartProvider>(context).cartItems.length,

                itemBuilder: (context, index) {
                  final cartItem = Provider.of<CartProvider>(
                    context,
                  ).cartItems[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 18),

                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(22),
                    ),

                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),

                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                              ),

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "cartItem.name",
                                style: AppTextStyles.subHeading,
                              ),

                              const SizedBox(height: 8),

                              Text(
                                "cartItem.price",
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),

                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  Text(
                                    "cartItem.quantity.toString()",
                                    style: AppTextStyles.subHeading,
                                  ),

                                  const SizedBox(width: 14),

                                  Container(
                                    padding: const EdgeInsets.all(6),

                                    decoration: BoxDecoration(
                                      color: AppColors.primary,

                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Icon(Iconsax.trash, color: Colors.red),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Total", style: AppTextStyles.subHeading),

                      Text(
                        "\$${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(0)}",
                        style: AppTextStyles.subHeading.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: () {},

                      child: Text("Checkout", style: AppTextStyles.button),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
