import 'package:thrifty/models/shipping_address.dart';

import '../../../models/cart.dart';

abstract class CheckoutEvent {}

class CheckoutSubmitted extends CheckoutEvent {
  final ShippingAddress shippingAddress;
  final Cart cart;
  final String userId;

  CheckoutSubmitted(
      {required this.shippingAddress,
      required this.cart,
      required this.userId});
}
