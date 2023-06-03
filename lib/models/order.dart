import 'cart.dart';

class OrderModel {
  final String? id;
  final String userId;
  final List<String> productIds;
  final List<int> quantities;
  final String deliveryAddress;
  final DateTime orderTime;
  final double totalAmount;
  final String status;

  OrderModel({
    this.id,
    required this.userId,
    required this.productIds,
    required this.quantities,
    required this.deliveryAddress,
    required this.orderTime,
    required this.totalAmount,
    this.status = 'Pending',
  });

  int get totalQuantity {
    return quantities.fold(0, (sum, quantity) => sum + quantity);
  }

  factory OrderModel.fromJson(String orderId, Map<String, dynamic> json) {
    return OrderModel(
      id: orderId,
      userId: json['userId'],
      productIds: List<String>.from(json['productIds']),
      quantities: List<int>.from(json['quantities']),
      deliveryAddress: json['deliveryAddress'],
      orderTime: DateTime.parse(json['orderTime']),
      totalAmount: json['totalAmount'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'userId': userId,
      'productIds': productIds,
      'quantities': quantities,
      'deliveryAddress': deliveryAddress,
      'orderTime': orderTime.toIso8601String(),
      'totalAmount': totalAmount,
      'status': status,
    };
  }

  static OrderModel fromCart(String userId, Cart cart, String deliveryAddress) {
    List<String> productIds = [];
    List<int> quantities = [];

    for (var item in cart.items) {
      productIds.add(item.product.id);
      quantities.add(item.quantity);
    }

    return OrderModel(
      userId: userId,
      productIds: productIds,
      quantities: quantities,
      deliveryAddress: deliveryAddress,
      orderTime: DateTime.now(),
      totalAmount: cart.totalPrice,
    );
  }
}
