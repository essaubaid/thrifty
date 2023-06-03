import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thrifty/models/order.dart';

class OrdersRepository {
  final _ordersCollection = FirebaseFirestore.instance.collection('orders');

  Future<void> submitOrder(OrderModel order) async {
    try {
      await _ordersCollection.doc().set(order.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrderModel>> getUserOrders(String userId) async {
    final snapshot =
        await _ordersCollection.where('userId', isEqualTo: userId).get();
    return snapshot.docs
        .map((doc) => OrderModel.fromJson(doc.id, doc.data()))
        .toList();
  }
}
