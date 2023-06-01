import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/screens/home/components/search_bar.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import 'categories.dart';
import 'featured_products.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: SearchBar(),
          ),
          const SizedBox(height: 20),
          const Categories(),
          const SizedBox(height: 30),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.loading) {
                return const CircularProgressIndicator();
              } else if (state.error.isNotEmpty) {
                return Text(state.error);
              } else {
                return FeaturedProducts(productList: state.featuredProducts);
              }
            },
          ),
        ],
      ),
    );
  }
}
