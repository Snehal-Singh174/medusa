import 'package:flutter/material.dart';

import '../model/product_model.dart';


class CartProductCard extends StatelessWidget {
  final ProductModel product;

  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$ ${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_circle)),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}
