import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order_model.dart';
import '../../providers/order_provider.dart';
import '../../providers/cart_provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
final cartProvider =
    Provider.of<CartProvider>(
  context,
);
final orderProvider =
    Provider.of<OrderProvider>(
  context,
  listen: false,
);
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          "Checkout",
          style: AppTextStyles.subHeading,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // ADDRESS
            Text(
              "Delivery Address",
              style: AppTextStyles.subHeading,
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius:
                    BorderRadius.circular(22),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Kartik Sharma",
                    style:
                        AppTextStyles.subHeading
                            .copyWith(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Ajmer, Rajasthan\nIndia",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // PAYMENT
            Text(
              "Payment Method",
              style: AppTextStyles.subHeading,
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius:
                    BorderRadius.circular(22),
              ),

              child: Row(
                children: [

                  const Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 14),

                  Text(
                    "Visa **** 4587",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ORDER SUMMARY
            Text(
              "Order Summary",
              style: AppTextStyles.subHeading,
            ),

            const SizedBox(height: 16),

            buildSummaryRow(
              "Subtotal",
              "\$${cartProvider.totalPrice.toStringAsFixed(0)}",
            ),

            buildSummaryRow(
              "Delivery",
              "\$20",
            ),

            buildSummaryRow(
              "Discount",
              "-\$10",
            ),

            const Divider(
              color: Colors.white24,
              height: 40,
            ),

            buildSummaryRow(
              "Total",
              "\$${(cartProvider.totalPrice + 20 - 10).toStringAsFixed(0)}",
              isTotal: true,
            ),

            const SizedBox(height: 40),

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

  if (cartProvider.cartItems.isEmpty) {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          "Your cart is empty",
        ),
      ),
    );

    return;
  }

  for (var item in cartProvider.cartItems) {

    Provider.of<OrderProvider>(
      context,
      listen: false,
    ).addOrder(

      OrderModel(

        orderId:
            DateTime.now()
                .millisecondsSinceEpoch
                .toString(),

        productName: item.name,

        productImage: item.image,

        price: item.price,

        date:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",

        status: "Delivered",
      ),
    );
  }

  cartProvider.clearCart();

  Navigator.push(

    context,

    MaterialPageRoute(
      builder: (context) =>
          const OrderSuccessScreen(),
    ),
  );
},
                child: Text(
                  "Place Order",
                  style:
                      AppTextStyles.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryRow(
    String title,
    String value, {
    bool isTotal = false,
  }) {

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,

            style:
                isTotal
                    ? AppTextStyles.subHeading
                    : AppTextStyles.body,
          ),

          Text(
            value,

            style:
                isTotal
                    ? AppTextStyles.subHeading
                    : AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}