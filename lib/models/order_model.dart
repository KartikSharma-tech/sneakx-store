class OrderModel {

  final String orderId;
  final String productName;
  final String productImage;
  final String price;
  final String date;
  final String status;

  OrderModel({

    required this.orderId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.date,
    required this.status,
  });
}