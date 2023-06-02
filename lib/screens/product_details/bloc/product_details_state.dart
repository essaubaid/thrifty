import '../../../models/product.dart';

abstract class ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError(this.error);
}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;
  final String selectedColor;
  final String selectedSize;

  ProductDetailsLoaded(
      {required this.product,
      required this.selectedColor,
      required this.selectedSize});

  ProductDetailsLoaded copyWith({
    Product? product,
    String? selectedColor,
    String? selectedSize,
  }) {
    return ProductDetailsLoaded(
      product: product ?? this.product,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
