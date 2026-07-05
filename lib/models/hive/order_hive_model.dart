import 'package:hive/hive.dart';

part 'order_hive_model.g.dart';

@HiveType(typeId: 2)
class OrderHiveModel {

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String price;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  String date;

  OrderHiveModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.date,
  });
}