import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/models/product.dart';
import 'package:thrifty/route_constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 170,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: InkWell(
          onTap: () {
            context.pushNamed(
              RouteConstants.productDetails,
              pathParameters: {'id': product.id},
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      child: Image.network(product.images[0]),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildCurrentRating(),
                      product.totalReviews != null
                          ? Text(
                              '${product.totalReviews} reviews',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          : Container(),
                      buildTrailingIcon()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildTrailingIcon() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: const Icon(
        Icons.more_vert,
        color: Color(0xFF838589),
        size: 24,
      ),
    );
  }

  Wrap buildCurrentRating() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 12,
        ),
        const SizedBox(width: 1),
        Text(
          product.rating.toString(),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
