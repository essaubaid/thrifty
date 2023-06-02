import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/components/default_button.dart';
import 'package:thrifty/models/shipping_address.dart';
import '../../../bloc/user_block.dart';
import '../../../bloc/user_state.dart';
import '../../shopping_cart/bloc/cart_bloc.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_events.dart';
import '../bloc/checkout_state.dart';
import 'order_summery_panel.dart';
import 'payment_method_panel.dart';
import 'shipping_address_card.dart';
import 'shipping_method_panel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.read<CartBloc>().state;

    final ShippingAddress shippingAddress = demoAddress;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Shipping Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ShippingAddressCard(shippingAddress: shippingAddress),
          const SizedBox(height: 30),
          const PaymentMethodPanel(),
          const SizedBox(height: 30),
          const ShippingMethodPanel(),
          const Spacer(),
          OrderSummeryPanel(
            subtotal: cartState.cart.totalPrice.toStringAsFixed(0),
            total: cartState.cart.totalPrice.toStringAsFixed(0),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CheckoutSuccess) {
                  return const Center(
                    child: Text("Order Submitted Successfully"),
                  );
                } else if (state is CheckoutFailure) {
                  return const Center(
                    child: Text("Order Submission Failed"),
                  );
                } else if (state is CheckoutInitial) {
                  return DefaultButton(
                    text: "Submit Order",
                    press: () {
                      final cartState = context.read<CartBloc>().state;
                      final userState = context.read<UserBloc>().state;
                      if (userState is UserLoggedIn) {
                        context.read<CheckoutBloc>().add(
                              CheckoutSubmitted(
                                userId: userState.user.id,
                                cart: cartState.cart,
                                shippingAddress: shippingAddress,
                              ),
                            );
                      }
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
