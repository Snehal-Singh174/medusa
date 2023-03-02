import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) =>  const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist',),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2.2),
          itemCount: ProductModel.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                productModel: ProductModel.products[index],
                widthFactor: 1.1,
                leftPosition: 100,
                isWishlist: true,
              ),
            );
          }),
    );
  }
}
