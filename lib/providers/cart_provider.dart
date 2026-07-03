import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier {

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

    notifyListeners();
  }

  // REMOVE ITEM
  void removeItem(CartModel item) {

    _cartItems.remove(item);

    notifyListeners();
  }

  // TOTAL PRICE
  double get totalPrice {

    double total = 0;

    for (var item in _cartItems) {

      final price = double.parse(
        item.price.replaceAll("\$", ""),
      );

      total += price * item.quantity;
    }

    return total;
  }
  void increaseQuantity(int index) {

  cartItems[index].quantity++;

  notifyListeners();
}

void decreaseQuantity(int index) {

  if (cartItems[index].quantity > 1) {

    cartItems[index].quantity--;

  } else {

    cartItems.removeAt(index);
  }

  notifyListeners();
}
void clearCart() {

  cartItems.clear();

  notifyListeners();
}
}