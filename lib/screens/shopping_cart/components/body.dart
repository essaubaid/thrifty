import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/size_config.dart';
import '../../../components/default_button.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import 'build_card_details.dart';
import 'build_image_holder.dart';
import 'total_amount_panel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: state.cart.items.length,
                  itemBuilder: (context, index) {
                    var item = state.cart.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 120,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildImageHolder(item: item),
                              BuildCardDetails(item: item),
                            ],
                          )),
                    );
                  },
                ),
              ),
              const Spacer(),
              TotalAmountPanel(
                totalPrice: state.cart.totalPrice,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: DefaultButton(
                  text: 'Checkout',
                  press: () {
                    context.pushNamed(RouteConstants.checkOut);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
