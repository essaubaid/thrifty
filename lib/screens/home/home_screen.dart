import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thrifty',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              context.pushNamed(RouteConstants.cart);
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}
