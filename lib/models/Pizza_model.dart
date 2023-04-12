import 'dart:ffi';

class Pizza {
  final String imageId;
  final String itemName;
  final double price;
  final String description;

  Pizza({
    required this.imageId,
    required this.itemName,
    required this.price,
    required this.description,
  });
}
