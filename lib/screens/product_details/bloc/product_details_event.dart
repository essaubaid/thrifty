abstract class ProductDetailsEvent {}

class FetchProductDetails extends ProductDetailsEvent {
  final int productId;

  FetchProductDetails({required this.productId});
}

class ColorChanged extends ProductDetailsEvent {
  final String color;

  ColorChanged(this.color);
}

class SizeChanged extends ProductDetailsEvent {
  final String size;

  SizeChanged(this.size);
}

class ImageChanged extends ProductDetailsEvent {
  final int imageIndex;

  ImageChanged(this.imageIndex);
}
