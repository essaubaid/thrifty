import '../../../models/order.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderModel> orders;

  OrdersLoaded(this.orders);
}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}
