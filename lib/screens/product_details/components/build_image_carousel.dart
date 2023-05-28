import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class BuildImageCarousel extends StatelessWidget {
  const BuildImageCarousel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenWidth(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenWidth(300),
            child: Center(
              child: CarouselSlider.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index, realIndex) {
                  final image = product.images[index];

                  return buildImage(image);
                },
                options: CarouselOptions(
                  aspectRatio: 1,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
          ),
          Text(
            '1/${product.images.length} Images',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String image) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(image),
    );
  }
}
