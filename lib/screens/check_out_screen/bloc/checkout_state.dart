import '../../../models/order.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final OrderModel order;

  CheckoutSuccess(this.order);
}

class CheckoutFailure extends CheckoutState {
  final String error;

  CheckoutFailure(this.error);
}
