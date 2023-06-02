import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/product.dart';

class ProductRepository {
  final List<Product> demoProductList = demoProducts;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<List<Product>> fetchFeaturedProducts() async {
    // await Future.delayed(const Duration(seconds: 1));
    await db.collection("products").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
    return demoProductList;
  }

  Future<Product> fetchProductById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return demoProductList.firstWhere((product) => product.id == id);
  }

  // Future<List<Product>> fetchProductsByCategory(String category) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return demoProducts.where((product) => product.category == category).toList();
  // }
}
