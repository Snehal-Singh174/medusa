import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/widgets/widgets.dart';

import '../../model/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: CategoryModel.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              )),
          const SectionTitle(
            title: 'RECOMMENDED',
          ),
          ProductCarousel(
            products: ProductModel.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          const SectionTitle(
            title: 'POPULAR',
          ),
          ProductCarousel(
            products: ProductModel.products
                .where((product) => product.isPopular)
                .toList(),
          )
        ],
      ),
    );
  }
}
