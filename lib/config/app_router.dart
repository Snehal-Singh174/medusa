import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(
            category: settings.arguments as CategoryModel);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as ProductModel);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
