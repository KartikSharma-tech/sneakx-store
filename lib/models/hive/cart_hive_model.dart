import 'package:hive/hive.dart';

part 'cart_hive_model.g.dart';

@HiveType(typeId: 0)
class CartHiveModel {

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String price;

  @HiveField(3)
  int quantity;

  CartHiveModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}