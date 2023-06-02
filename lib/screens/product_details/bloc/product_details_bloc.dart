import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product.dart';
import '../../../repository/product_repo.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository productRepo;

  ProductDetailsBloc({required this.productRepo})
      : super(ProductDetailsLoading()) {
    // starts loading immediately
    on<FetchProductDetails>((event, emit) async {
      try {
        Product product = await productRepo.fetchProductById(event.productId);
        emit(ProductDetailsLoaded(
          product: product,
          selectedColor: product.colors[0],
          selectedSize: product.sizes[0],
        ));
      } catch (e) {
        emit(ProductDetailsError(e.toString()));
      }
    });

    on<ColorChanged>((event, emit) {
      if (state is ProductDetailsLoaded) {
        emit((state as ProductDetailsLoaded)
            .copyWith(selectedColor: event.color));
      }
    });

    on<SizeChanged>((event, emit) {
      if (state is ProductDetailsLoaded) {
        emit(
            (state as ProductDetailsLoaded).copyWith(selectedSize: event.size));
      }
    });

    on<ImageChanged>((event, emit) {
      if (state is ProductDetailsLoaded) {
        emit((state as ProductDetailsLoaded)
            .copyWith(selectedImage: event.imageIndex));
      }
    });
  }
}
