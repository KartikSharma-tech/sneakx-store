import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/hive/wishlist_hive_model.dart';
import '../models/wishlist_model.dart';

class WishlistProvider extends ChangeNotifier {

  final Box<WishlistHiveModel> wishlistBox =
      Hive.box<WishlistHiveModel>("wishlistBox");

  final List<WishlistModel> _wishlistItems = [];

  List<WishlistModel> get wishlistItems => _wishlistItems;

  WishlistProvider() {
    loadWishlistItems();
  }

  void loadWishlistItems() {

    _wishlistItems.clear();

    for (var item in wishlistBox.values) {

      _wishlistItems.add(
        WishlistModel(
          name: item.name,
          image: item.image,
          price: item.price,
          category: "Sneakers",
        ),
      );
    }

    notifyListeners();
  }

  void saveWishlistItems() {

    wishlistBox.clear();

    for (var item in _wishlistItems) {

      wishlistBox.add(
        WishlistHiveModel(
          name: item.name,
          image: item.image,
          price: item.price,
        ),
      );
    }
  }

  void toggleWishlist(WishlistModel product) {

    final exists = _wishlistItems.any(
      (item) => item.name == product.name,
    );

    if (exists) {

      _wishlistItems.removeWhere(
        (item) => item.name == product.name,
      );

    } else {

      _wishlistItems.add(product);
    }

    saveWishlistItems();

    notifyListeners();
  }

  bool isInWishlist(String name) {

    return _wishlistItems.any(
      (item) => item.name == name,
    );
  }
}