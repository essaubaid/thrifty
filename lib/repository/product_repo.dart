import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import '../models/product.dart';

class ProductRepository {
  final List<Product> demoProductList = demoProducts;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<List<Product>> fetchFeaturedProducts() async {
    var snapshot = await db.collection("products").get();
    var products = snapshot.docs
        .map((doc) => Product.fromJson(doc.id, doc.data()))
        .toList();
    return products;
  }

  Future<Product> fetchProductById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return demoProductList.firstWhere((product) => product.id == id);
  }

  Future<String> uploadImageAndGetDownloadURL(String imagePath) async {
    final ref = storage.ref('product_images/${basename(imagePath)}');
    final taskSnapshot = await ref.putFile(File(imagePath));
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<void> bulkUploadDemoProducts() async {
    for (var product in demoProductList) {
      for (var i = 0; i < product.images.length; i++) {
        product.images[i] =
            await uploadImageAssetAndGetDownloadURL(product.images[i]);
      }
      await db.collection('products').doc().set(product.toJson());
      // break;
    }
  }

  Future<String> uploadImageAssetAndGetDownloadURL(String assetPath) async {
    // Load asset as bytes
    ByteData bytes = await rootBundle.load(assetPath);

    // Create a Uint8List from the ByteData
    Uint8List data = bytes.buffer.asUint8List();

    // Create a unique name for the file
    String fileName = basename(assetPath);

    // Upload to Firebase Storage
    Reference ref =
        FirebaseStorage.instance.ref().child('product_images/$fileName');
    UploadTask uploadTask = ref.putData(data);

    // Wait for the upload to complete and get the download URL
    String downloadURL = await (await uploadTask).ref.getDownloadURL();

    return downloadURL;
  }

  // Future<List<Product>> fetchProductsByCategory(String category) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return demoProducts.where((product) => product.category == category).toList();
  // }
}
