import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Product {
  String imageId;
  String itemName;
  int quantity;
  double price;

  Product({
    required this.imageId,
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {'name': itemName, 'price': price, 'quantity': quantity};
  }

  Future<void> storeProducts(List<Product> products) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final CollectionReference productsRef =
          FirebaseFirestore.instance.collection('user');

      final List<Map<String, dynamic>> productsMapList =
          products.map((product) => product.toMap()).toList();

      await productsRef.doc(uid).set({'cart-items': productsMapList});

      print('Products stored successfully!');
    } catch (e) {
      print('Error storing products: $e');
    }
  }

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      imageId: '',
      itemName: data['name'],
      price: data['price'],
      quantity: data['quantity'],
    );
  }
}
