import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cart.dart';
import 'cart_events.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>((event, emit) async {
      CartItem newItem = event.cartItem;

      CartItem? existingItem = state.cart.items.firstWhereOrNull(
        (item) =>
            item.product.id == newItem.product.id &&
            item.color == newItem.color &&
            item.size == newItem.size,
      );

      if (existingItem == null) {
        state.cart.items.add(newItem);
      } else {
        existingItem.quantity += 1;
      }

      emit(state.copyWith(cart: Cart(items: List.from(state.cart.items))));
    });

    on<DecreaseCartItemQuantity>((event, emit) {
      CartItem cartItemToDecrease = event.cartItem;

      CartItem? existingItem = state.cart.items.firstWhereOrNull(
        (item) =>
            item.product.id == cartItemToDecrease.product.id &&
            item.color == cartItemToDecrease.color &&
            item.size == cartItemToDecrease.size,
      );

      if (existingItem != null) {
        if (existingItem.quantity > 1) {
          existingItem.quantity -= 1;
        } else {
          state.cart.items.remove(existingItem);
        }
        emit(state.copyWith(cart: Cart(items: List.from(state.cart.items))));
      }
    });

    on<RemoveFromCart>((event, emit) async {
      state.cart.removeItem(event.cartItem);
      emit(state.copyWith(cart: Cart(items: List.from(state.cart.items))));
    });

    on<ClearCart>((event, emit) async {
      state.cart.items.clear();
      emit(state.copyWith(cart: Cart(items: List.from(state.cart.items))));
    });
  }
}
