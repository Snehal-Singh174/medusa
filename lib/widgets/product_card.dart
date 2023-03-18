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
      this.widthFactor = 1.45,
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
        if (isCatalog || isWishlist) {
          Navigator.pushNamed(context, '/product', arguments: productModel);
        }
      },
      child: (isCart || isSummary)
          ? Row(
              children: [
                ProductImage(
                  adjwidth: adjwidth,
                  productModel: productModel,
                  height: height,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ProductInformation(
                    productModel: productModel,
                    fontColor: fontColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ProductActions(
                  productModel: productModel,
                  isWishlist: isWishlist,
                  isCatalog: isCatalog,
                  isCart: isCart,
                  iconColor: iconColor,
                )
              ],
            )
          : Stack(
              alignment: Alignment.bottomCenter,
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
                    decoration:
                        BoxDecoration(color: Colors.black.withAlpha(50)),
                  ),
                ),
                ProductBackground(adjWidth: adjwidth, widgets: [
                  ProductInformation(
                    productModel: productModel,
                    fontColor: fontColor,
                  ),
                  ProductActions(
                    productModel: productModel,
                    isWishlist: isWishlist,
                    isCatalog: isCatalog,
                    isCart: isCart,
                    iconColor: iconColor,
                  )
                ])
              ],
            ),
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions(
      {Key? key,
      required this.productModel,
      required this.isCatalog,
      required this.isWishlist,
      required this.isCart,
      required this.iconColor,
      this.quantity})
      : super(key: key);

  final ProductModel productModel;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              IconButton addProduct = IconButton(
                  onPressed: () {
                    // const snackBar =
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to your cart')));
                    context
                        .read<CartBloc>()
                        .add(CartProductAdded(productModel));
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: iconColor,
                  ));
              IconButton removeProduct = IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Removed from your cart'),
                    ),
                  );
                  context.read<CartBloc>().add(
                        CartProductRemoved(productModel),
                      );
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: iconColor,
                ),
              );
              IconButton removeFromWishlist = IconButton(
                onPressed: () {
                  // const snackBar = ;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Remove from your wishlist'),
                    ),
                  );
                  context.read<WishlistBloc>().add(
                        RemoveWishlistProduct(productModel),
                      );
                },
                icon: Icon(
                  Icons.delete,
                  color: iconColor,
                ),
              );
              Text productQuantity = Text(
                '$quantity',
                style: Theme.of(context).textTheme.headline5,
              );
              if (isCatalog) {
                return Row(children: [addProduct]);
              }
              if (isWishlist) {
                return Row(children: [addProduct, removeFromWishlist]);
              }
              if (isCart) {
                return Row(children: [
                  removeProduct,
                  productQuantity,
                  addProduct,
                ]);
              } else {
                return const SizedBox();
              }
            } else {
              return const Text("Something went wrong");
            }
          },
        ),
        // isWishlist
        //     ? BlocBuilder<WishlistBloc, WishlistState>(
        //         builder: (context, state) {
        //           return IconButton(
        //               onPressed: () {
        //                 context
        //                     .read<WishlistBloc>()
        //                     .add(RemoveWishlistProduct(productModel));
        //                 const snackBar = SnackBar(
        //                     content: Text('Remove from your wishlist'));
        //                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //               },
        //               icon: const Icon(
        //                 Icons.delete,
        //                 color: Colors.white,
        //               ));
        //         },
        //       )
        //     : SizedBox()
      ],
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation(
      {Key? key,
      required this.productModel,
      required this.fontColor,
      this.isOrderSummary = false,
      this.quantity})
      : super(key: key);

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

class ProductBackground extends StatelessWidget {
  const ProductBackground(
      {Key? key, required this.adjWidth, required this.widgets})
      : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...widgets,
            ],
          ),
        ),
      ),
    );
  }
}
