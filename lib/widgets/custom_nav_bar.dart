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
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ? GoToCheckoutNavBar()
                : (screen == '/checkout')
                    ? OrderNowNavBar()
                    : HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/user");
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ))
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({Key? key, required this.product}) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WishlistLoaded) {
              return IconButton(
                onPressed: () {
                  context
                      .read<WishlistBloc>()
                      .add(AddWishlistProduct(product!));
                  const snackBar =
                      SnackBar(content: Text('Added to your wishlist'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CartLoaded) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product!));
                  Navigator.pushNamed(context, "/cart");
                },
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}
