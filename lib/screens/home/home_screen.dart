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
          SectionTitle(
            title: 'RECOMMENDED',
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 150,
                child: Image.network(ProductModel.products[0].imageUrl, fit: BoxFit.cover,),
              ),
              Positioned(
                top: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(50)
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
