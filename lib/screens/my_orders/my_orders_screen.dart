import 'package:flutter/material.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import 'components/body.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: const Color(0xFFF9F9F9),
        body: const Body());
  }
}
