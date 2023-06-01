import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product.dart';
import '../../../repository/product_repo.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepo;

  HomeBloc({required this.productRepo}) : super(HomeState.initial()) {
    on<FetchFeaturedProducts>(fetchFeaturedProducts);
  }

  Future<void> fetchFeaturedProducts(
      FetchFeaturedProducts event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      List<Product> products = await productRepo.fetchFeaturedProducts();
      emit(state.copyWith(featuredProducts: products, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
