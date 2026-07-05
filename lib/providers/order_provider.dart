import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/order_model.dart';
import '../models/hive/order_hive_model.dart';

class OrderProvider extends ChangeNotifier {

  final Box<OrderHiveModel> orderBox =
      Hive.box<OrderHiveModel>("orderBox");

  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  OrderProvider() {
    loadOrders();
  }

  void loadOrders() {

    _orders.clear();

    for (var item in orderBox.values) {

      _orders.add(
        OrderModel(
  orderId: DateTime.now().toString(),

  productName: item.name,

  productImage: item.image,

  price: item.price,

  date: item.date,

  status: "Completed",
  quantity: item.quantity,
)
      );
    }

    notifyListeners();
  }

  void saveOrders() {

    orderBox.clear();

    for (var item in _orders) {

      orderBox.add(
        OrderHiveModel(
          name: item.productName,
          image: item.productImage      ,
          price: item.price,
          quantity: item.quantity,
          date: item.date,
        ),
      );
    }
  }

  void addOrder(OrderModel order) {

    _orders.insert(0, order);

    saveOrders();

    notifyListeners();
  }
}