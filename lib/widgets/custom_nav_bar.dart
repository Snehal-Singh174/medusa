import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa/bloc/checkout/checkout_bloc.dart';
import 'package:medusa/widgets/google_pay.dart';
import 'package:medusa/widgets/widgets.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/wishlist/wishlist_bloc.dart';
import '../model/models.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final ProductModel? product;

  const CustomNavBar({Key? key, this.screen = '/', this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/order-confirmation':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        icon: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/user");
          },
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ))
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, "/checkout");
        },
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.headline3!,
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (State is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            if (Platform.isAndroid) {
              return GooglePay(total: state.total!, products: state.product!);
            }
            if (Platform.isIOS) {
              return ApplePay(total: state.total!, products: state.product!);
            } else {
              return Text(
                "Something went wrong",
                style: Theme.of(context).textTheme.headline3,
              );
            }
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<WishlistBloc>().add(AddWishlistProduct(product));
              const snackBar =
                  SnackBar(content: Text('Added to your wishlist'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          );
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              context.read<CartBloc>().add(CartProductAdded(product));
              Navigator.pushNamed(context, "/cart");
            },
            child: Text(
              'ADD TO CART',
              style: Theme.of(context).textTheme.headline3!,
            ),
          );
        },
      ),
    ];
  }
}
