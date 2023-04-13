import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class WishListScreen extends StatefulWidget {
  final List<Product> wishlistItems;
  WishListScreen({super.key, required this.wishlistItems});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.wishlistItems.length,
          itemBuilder: (context, index) {
            final item = widget.wishlistItems[index];
            return ListTile(
              title: Text(item.itemName),
            );
          }),
    );
  }
}
