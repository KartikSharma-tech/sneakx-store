import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/order_provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final orders =
        Provider.of<OrderProvider>(context).orders;

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          "My Orders",
          style: AppTextStyles.subHeading,
        ),
      ),

      body: orders.isEmpty

          ? Center(
              child: Text(
                "No Orders Yet",
                style: AppTextStyles.subHeading,
              ),
            )

          : ListView.builder(

              padding: const EdgeInsets.all(20),

              itemCount: orders.length,

              itemBuilder: (context, index) {

                final order = orders[index];

                return Container(

                  margin: const EdgeInsets.only(
                    bottom: 18,
                  ),

                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(

                    color: AppColors.cardColor,

                    borderRadius:
                        BorderRadius.circular(24),
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 80,
                        height: 80,

                        decoration: BoxDecoration(

                          borderRadius:
                              BorderRadius.circular(18),

                          image: DecorationImage(

                            image: NetworkImage(
                              order.productImage,
                            ),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(

                              order.productName,

                              maxLines: 1,

                              overflow:
                                  TextOverflow.ellipsis,

                              style:
                                  AppTextStyles.subHeading,
                            ),

                            const SizedBox(height: 8),

                            Text(

                              order.price,

                              style: AppTextStyles.body
                                  .copyWith(

                                color:
                                    AppColors.primary,

                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(

                              "Order Date: ${order.date}",

                              style:
                                  AppTextStyles.body,
                            ),

                            const SizedBox(height: 8),

                            Container(

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(

                                color:
                                    Colors.green.withValues(
                                  alpha: 0.15,
                                ),

                                borderRadius:
                                    BorderRadius.circular(
                                  20,
                                ),
                              ),

                              child: Text(

                                order.status,

                                style: TextStyle(

                                  color: Colors.green,

                                  fontWeight:
                                      FontWeight.w600,
                                ),
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