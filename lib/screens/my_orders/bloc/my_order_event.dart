abstract class OrdersEvent {}

class FetchOrders extends OrdersEvent {
  final String userId;

  FetchOrders(this.userId);
}
