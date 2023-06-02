class Product {
  final String id;
  final String title, description;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;
  final double rating, price;
  final bool isFavorite, isPopular;
  final int? totalReviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.sizes,
    required this.colors,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    this.isPopular = false,
    this.totalReviews,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'images': images,
      'sizes': sizes,
      'colors': colors,
      'rating': rating,
      'price': price,
      'isFavorite': isFavorite,
      'isPopular': isPopular,
      'totalReviews': totalReviews,
    };
  }

  factory Product.fromJson(String id, Map<String, dynamic> json) {
    return Product(
      id: id,
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      isFavorite: json['isFavorite'] ?? false,
      isPopular: json['isPopular'] ?? false,
      totalReviews: json['totalReviews'],
    );
  }
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: '1',
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    sizes: ["S", "M", "L", "XL"],
    colors: ['#020202', '#F6F6F6', '#B82222', '#151867'],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavorite: true,
    isPopular: true,
    totalReviews: 3356,
  ),
  Product(
    id: '2',
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    sizes: ["S", "M", "L", "XL"],
    colors: ['#020202', '#F6F6F6', '#B82222', '#151867'],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: '3',
    images: [
      "assets/images/glap.png",
    ],
    sizes: ["S", "M", "L", "XL"],
    colors: ['#020202', '#F6F6F6', '#B82222', '#151867'],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: '4',
    images: [
      "assets/images/wireless headset.png",
    ],
    sizes: ["S", "M", "L", "XL"],
    colors: ['#020202', '#F6F6F6', '#B82222', '#151867'],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavorite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
