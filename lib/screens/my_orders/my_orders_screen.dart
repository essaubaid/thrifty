import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/bloc/user_block.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import '../../bloc/user_state.dart';
import '../../repository/order_repo.dart';
import 'bloc/my_order_bloc.dart';
import 'bloc/my_order_event.dart';
import 'bloc/my_orders_state.dart';
import 'components/body.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserBloc>().state;

    if (userState is UserLoggedIn) {
      final userId = userState.user.id;

      return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: const Color(0xFFF9F9F9),
        body: BlocProvider(
          create: (context) => MyOrdersBloc(
            ordersRepository: context.read<OrdersRepository>(),
          )..add(FetchOrders(userId)),
          child: BlocBuilder<MyOrdersBloc, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OrdersLoaded) {
                return Body(
                  orders: state.orders,
                );
              } else if (state is OrdersError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Container();
            },
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('Please login to view your orders'),
      );
    }
  }
}
