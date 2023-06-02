import '../../../models/cart.dart';

class CartState {
  Cart cart;

  CartState({Cart? cart}) : cart = cart ?? Cart(items: []);

  CartState copyWith({Cart? cart}) {
    return CartState(cart: cart ?? this.cart);
  }
}
