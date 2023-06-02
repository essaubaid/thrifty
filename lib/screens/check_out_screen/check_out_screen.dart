import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/order_repo.dart';
import 'bloc/checkout_bloc.dart';
import 'components/body.dart';
import 'components/check_out_app_bar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(
        ordersRepository: context.read<OrdersRepository>(),
      ),
      child: const Scaffold(
        appBar: CheckoutAppBar(),
        backgroundColor: Color(0xFFF9F9F9),
        body: Body(),
      ),
    );
  }
}
