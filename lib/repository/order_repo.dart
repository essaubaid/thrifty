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

  Stream<List<OrderModel>> getUserOrders(String userId) {
    return _ordersCollection.where('userId', isEqualTo: userId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList());
  }
}
