import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/hive/cart_hive_model.dart';
import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final Box<CartHiveModel> cartBox = Hive.box<CartHiveModel>("cartBox");

  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;

  // ADD TO CART
  void addToCart(CartModel item) {
    final existingIndex = _cartItems.indexWhere(
      (element) => element.name == item.name,
    );

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(item);
    }

    saveCartItems();

    notifyListeners();
  }

  //
  void loadCartItems() {
    cartItems.clear();

    for (var item in cartBox.values) {
      cartItems.add(
        CartModel(
          name: item.name,
          image: item.image,
          price: item.price,
          quantity: item.quantity,
        ),
      );
    }

    notifyListeners();
  }

  CartProvider() {
    loadCartItems();
  }
  void saveCartItems() {
    cartBox.clear();

    for (var item in cartItems) {
      cartBox.add(
        CartHiveModel(
          name: item.name,
          image: item.image,
          price: item.price,
          quantity: item.quantity,
        ),
      );
    }
  } // /////////////////////

  // REMOVE ITEM
  void removeItem(CartModel item) {
    _cartItems.remove(item);
    saveCartItems();
    notifyListeners();
  }

  // TOTAL PRICE
  double get totalPrice {
    double total = 0;

    for (var item in _cartItems) {
      final price = double.parse(item.price.replaceAll("\$", ""));

      total += price * item.quantity;
    }

    return total;
  }

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    saveCartItems();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }
    saveCartItems();
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    saveCartItems();
    notifyListeners();
  }
}
