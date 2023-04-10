import 'dart:ffi';

class Burger {
  final String imageId;
  final String itemName;
  final double price;
  final String description;

  Burger(
      {required this.imageId,
      required this.itemName,
      required this.price,
      required this.description});
}
