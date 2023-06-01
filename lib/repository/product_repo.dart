import '../models/product.dart';

class ProductRepository {
  final List<Product> demoProductList = demoProducts;

  Future<List<Product>> fetchFeaturedProducts() async {
    // await Future.delayed(const Duration(seconds: 1));
    return demoProductList;
  }

  Future<Product> fetchProductById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return demoProductList.firstWhere((product) => product.id == id);
  }

  // Future<List<Product>> fetchProductsByCategory(String category) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return demoProducts.where((product) => product.category == category).toList();
  // }
}
