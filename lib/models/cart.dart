import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String color;
  final String size;

  CartItem({
    required this.product,
    required this.color,
    required this.size,
    this.quantity = 1,
  });

  double get totalPrice => quantity * product.price;
}

class Cart {
  List<CartItem> items = [];

  Cart({required this.items});

  // void addItem(Product product) {
  //   final existingItem = items.firstWhere(
  //       (item) => item.product.id == product.id,
  //       orElse: () => null);

  //   if (existingItem == null) {
  //     items.add(CartItem(product: product));
  //   } else {
  //     existingItem.quantity += 1;
  //   }
  // }

  void removeItem(Product product) {
    items.removeWhere((item) => item.product.id == product.id);
  }

  double get totalPrice =>
      items.fold(0, (total, item) => total + item.totalPrice);
}

//Demo data for our cart
Cart demoCart = Cart(
  items: [
    CartItem(
        product: demoProducts[0], quantity: 1, color: 'White', size: 'Large'),
    CartItem(
        product: demoProducts[1], quantity: 2, color: 'Red', size: 'Small'),
    CartItem(
        product: demoProducts[2], quantity: 1, color: 'Blue', size: 'Medium'),
    CartItem(
        product: demoProducts[3], quantity: 3, color: 'Black', size: 'Large'),
  ],
);
