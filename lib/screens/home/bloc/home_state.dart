import '../../../models/product.dart';

class HomeState {
  final List<Product> featuredProducts;
  final bool loading;
  final String error;

  HomeState({
    required this.featuredProducts,
    required this.loading,
    required this.error,
  });

  HomeState.initial()
      : featuredProducts = [],
        loading = false,
        error = '';

  HomeState copyWith({
    List<Product>? featuredProducts,
    bool? loading,
    String? error,
  }) {
    return HomeState(
      featuredProducts: featuredProducts ?? this.featuredProducts,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
