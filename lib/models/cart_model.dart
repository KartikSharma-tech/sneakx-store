class CartModel {

  final String name;
  final String image;
  final String price;

  int quantity;

  CartModel({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}