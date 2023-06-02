import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import 'package:thrifty/models/product.dart';
import 'package:thrifty/screens/product_details/bloc/product_details_bloc.dart';
import 'package:thrifty/screens/product_details/bloc/product_details_state.dart';

import '../../repository/product_repo.dart';
import 'bloc/product_details_event.dart';
import 'components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(
        productRepo: RepositoryProvider.of<ProductRepository>(context),
      )..add(FetchProductDetails(productId: productId)),
      child: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsError) {
              return Text(state.error);
            } else if (state is ProductDetailsLoaded) {
              return SingleChildScrollView(
                  child: Body(
                product: state.product,
                selectedColor: state.selectedColor,
                selectedSize: state.selectedSize,
                index: state.selectedImage,
              ));
            } else {
              return Center(child: Container());
            }
          }),
        ),
      ),
    );
  }

  CustomAppBar buildAppBar() {
    return CustomAppBar(
      title: const Text(
        'Product Details',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
