import '../../../models/cart.dart';

class CartState {
  Cart cart;

  CartState({required this.cart});

  CartState copyWith({Cart? cart}) {
    return CartState(cart: cart ?? this.cart);
  }
}
