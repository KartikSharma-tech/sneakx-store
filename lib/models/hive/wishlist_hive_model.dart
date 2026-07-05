import 'package:hive/hive.dart';

part 'wishlist_hive_model.g.dart';

@HiveType(typeId: 1)
class WishlistHiveModel {

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String price;

  WishlistHiveModel({
    required this.name,
    required this.image,
    required this.price,
  });
}