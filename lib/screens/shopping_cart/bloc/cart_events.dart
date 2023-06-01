import '../../../models/cart.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final CartItem cartItem;

  AddToCart({required this.cartItem});
}

class RemoveFromCart extends CartEvent {
  final CartItem cartItem;

  RemoveFromCart({required this.cartItem});
}

class UpdateCartItem extends CartEvent {
  final CartItem cartItem;

  UpdateCartItem({required this.cartItem});
}

class DecreaseCartItemQuantity extends CartEvent {
  final CartItem cartItem;

  DecreaseCartItemQuantity({required this.cartItem});
}

class ClearCart extends CartEvent {}
