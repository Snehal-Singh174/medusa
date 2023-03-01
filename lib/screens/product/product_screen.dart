import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  static const String routeName = '/product';

  final ProductModel product;

  static Route route({required ProductModel product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: product.name,
        ),
        bottomNavigationBar: CustomNavBar(),
        body: CarouselSlider(
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
            options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height)));
  }
}
