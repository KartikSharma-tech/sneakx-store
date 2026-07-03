import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

import '../../providers/wishlist_provider.dart';


class WishlistScreen extends StatelessWidget {

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final wishlistProvider =
        Provider.of<WishlistProvider>(
      context,
    );

    return Scaffold(

      backgroundColor:
          AppColors.background,

      appBar: AppBar(

        title: Text(
          "Wishlist",
          style:
              AppTextStyles.subHeading,
        ),
      ),

      body:
          wishlistProvider
                  .wishlistItems
                  .isEmpty

              ? Center(

                  child: Text(
                    "No items in wishlist ❤️",

                    style:
                        AppTextStyles.body,
                  ),
                )

              : ListView.builder(

                  padding:
                      const EdgeInsets.all(
                    20,
                  ),

                  itemCount:
                      wishlistProvider
                          .wishlistItems
                          .length,

                  itemBuilder:
                      (context, index) {

                    final item =
                        wishlistProvider
                            .wishlistItems[
                                index];

                    return Container(

                      margin:
                          const EdgeInsets.only(
                        bottom: 18,
                      ),

                      padding:
                          const EdgeInsets.all(
                        14,
                      ),

                      decoration:
                          BoxDecoration(

                        color:
                            AppColors.cardColor,

                        borderRadius:
                            BorderRadius.circular(
                          22,
                        ),
                      ),

                      child: Row(

                        children: [

                          ClipRRect(

                            borderRadius:
                                BorderRadius.circular(
                              16,
                            ),

                            child: Image.network(

                              item.image,

                              width: 80,
                              height: 80,

                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(
                            width: 14,
                          ),

                          Expanded(

                            child: Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                Text(

                                  item.name,

                                  maxLines: 1,

                                  overflow:
                                      TextOverflow
                                          .ellipsis,

                                  style:
                                      AppTextStyles
                                          .subHeading
                                          .copyWith(
                                    fontSize: 17,
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                Text(

                                  item.price,

                                  style:
                                      AppTextStyles
                                          .body
                                          .copyWith(
                                    color:
                                        AppColors
                                            .primary,

                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(

                            onPressed: () {

                              wishlistProvider
                                  .toggleWishlist(
                                item,
                              );
                            },

                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
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