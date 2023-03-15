import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa/bloc/cart/cart_bloc.dart';
import 'package:medusa/bloc/wishlist/wishlist_bloc.dart';

import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isCart;
  final bool isWishlist;
  final bool isSummary;
  final Color iconColor;
  final Color fontColor;

  const ProductCard.catalog(
      {Key? key,
      required this.productModel,
      this.iconColor = Colors.white,
      this.fontColor = Colors.white,
      this.quantity,
      this.widthFactor = 1.5,
      this.height = 150,
      this.isCatalog = true,
      this.isCart = false,
      this.isSummary = false,
      this.isWishlist = false})
      : super(key: key);

  const ProductCard.cart(
      {Key? key,
      required this.productModel,
      this.iconColor = Colors.black,
      this.fontColor = Colors.black,
      this.quantity,
      this.widthFactor = 2.25,
      this.height = 80,
      this.isCatalog = false,
      this.isCart = true,
      this.isSummary = false,
      this.isWishlist = false})
      : super(key: key);

  const ProductCard.wishlist(
      {Key? key,
      required this.productModel,
      this.iconColor = Colors.white,
      this.fontColor = Colors.white,
      this.quantity,
      this.widthFactor = 1.1,
      this.height = 150,
      this.isCatalog = false,
      this.isCart = false,
      this.isSummary = false,
      this.isWishlist = true})
      : super(key: key);

  const ProductCard.summary(
      {Key? key,
      required this.productModel,
      this.iconColor = Colors.black,
      this.fontColor = Colors.black,
      this.quantity,
      this.widthFactor = 2.25,
      this.height = 80,
      this.isCatalog = false,
      this.isCart = false,
      this.isSummary = true,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / widthFactor;
    final double adjwidth = width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: productModel);
      },
      child: Stack(
        children: [
          ProductImage(
            adjwidth: adjwidth,
            productModel: productModel,
            height: height,
          ),
          Positioned(
            top: 60,
            left: 5,
            child: Container(
              width: adjwidth - 10,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: Container(
              width: adjwidth - 20,
              height: 70,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ProductInformation(productModel: productModel, fontColor: fontColor,),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(productModel));
                                  const snackBar = SnackBar(
                                      content: Text('Added to your cart'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                )),
                          );
                        } else {
                          return const Text("Something went wrong");
                        }
                      },
                    ),
                    isWishlist
                        ? BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, state) {
                              return Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      context.read<WishlistBloc>().add(
                                          RemoveWishlistProduct(productModel));
                                      const snackBar = SnackBar(
                                          content: Text(
                                              'Remove from your wishlist'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                              );
                            },
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.productModel,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity
  }) : super(key: key);

  final ProductModel productModel;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.name,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white),
        ),
        Text(
          '\$${productModel.price}',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjwidth,
    required this.height,
    required this.productModel,
  }) : super(key: key);

  final double adjwidth;
  final ProductModel productModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjwidth,
      height: height,
      child: Image.network(
        productModel.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
