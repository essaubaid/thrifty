import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/screens/home/components/body.dart';

import '../../repository/product_repo.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        productRepo: context.read<ProductRepository>(),
      )..add(FetchFeaturedProducts()),
      child: Scaffold(
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
              icon: const Icon(Icons.person_outline),
              onPressed: () {
                context.pushNamed(RouteConstants.profile);
              },
            ),
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
      ),
    );
  }
}
