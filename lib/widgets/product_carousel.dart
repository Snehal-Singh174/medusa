import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<ProductModel> products;

  const ProductCarousel({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ProductCard.catalog(productModel: products[index]),
            );
          }),
    );
  }
}
