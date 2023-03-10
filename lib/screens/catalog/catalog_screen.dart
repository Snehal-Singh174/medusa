import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, required this.category,}) : super(key: key);

  static const String routeName = '/catalog';

  final CategoryModel category;

  static Route route({required CategoryModel category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> categoryProduct = ProductModel.products.where((product) => product.category == category.name).toList();
    return Scaffold(
        appBar: CustomAppBar(
          title: category.name,
        ),
        bottomNavigationBar: CustomNavBar(screen: routeName,),
        body: GridView.builder(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: categoryProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  productModel: categoryProduct[index],
                  widthFactor: 2.2,
                ),
              );
            }));
  }
}
