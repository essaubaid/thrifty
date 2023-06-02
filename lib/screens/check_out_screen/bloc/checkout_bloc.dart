import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/order.dart';
import '../../../repository/order_repo.dart';
import 'checkout_events.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final OrdersRepository _ordersRepository;

  CheckoutBloc({required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository,
        super(CheckoutInitial()) {
    on<CheckoutSubmitted>(_onCheckoutSubmitted);
  }

  Future<void> _onCheckoutSubmitted(
      CheckoutSubmitted event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());
    try {
      OrderModel newOrder = OrderModel.fromCart(
          event.userId, event.cart, event.shippingAddress.getFullAddress());

      await _ordersRepository.submitOrder(newOrder);
      emit(CheckoutSuccess(newOrder));
    } catch (e) {
      emit(CheckoutFailure(e.toString()));
    }
  }
}
