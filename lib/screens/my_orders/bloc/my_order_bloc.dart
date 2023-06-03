import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/order_repo.dart';
import 'my_order_event.dart';
import 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository ordersRepository;

  MyOrdersBloc({required this.ordersRepository}) : super(OrdersInitial()) {
    on<FetchOrders>((event, emit) async {
      emit(OrdersLoading());

      try {
        final orders = await ordersRepository.getUserOrders(event.userId);
        emit(OrdersLoaded(orders));
      } catch (e) {
        emit(OrdersError(e.toString()));
      }
    });
  }
}
