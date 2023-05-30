import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/check_out_app_bar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CheckoutAppBar(),
      backgroundColor: Color(0xFFF9F9F9),
      body: Body(),
    );
  }
}
