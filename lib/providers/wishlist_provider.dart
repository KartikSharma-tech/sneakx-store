import 'package:flutter/material.dart';

import '../models/wishlist_model.dart';

class WishlistProvider extends ChangeNotifier {

  final List<WishlistModel>
      _wishlistItems = [];

  List<WishlistModel>
      get wishlistItems =>
          _wishlistItems;

  void toggleWishlist(
      WishlistModel product) {

    final exists =
        _wishlistItems.any(

      (item) =>
          item.name == product.name,
    );

    if (exists) {

      _wishlistItems.removeWhere(

        (item) =>
            item.name == product.name,
      );

    } else {

      _wishlistItems.add(product);
    }

    notifyListeners();
  }

  bool isInWishlist(String name) {

    return _wishlistItems.any(
      (item) => item.name == name,
    );
  }
}