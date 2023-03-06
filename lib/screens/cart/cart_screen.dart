import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     'Add \$20.0 for FREE DELIVERY',
                     style: Theme.of(context).textTheme.headline5,
                   ),
                   ElevatedButton(
                     onPressed: () {
                       Navigator.pushNamed(context, "/");
                     },
                     style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.black,
                         shape: const RoundedRectangleBorder(),
                         elevation: 0),
                     child: Text(
                       "Add More Items",
                       style: Theme.of(context)
                           .textTheme
                           .headline5!
                           .copyWith(color: Colors.white),
                     ),
                   ),
                 ],
               ),
               const SizedBox(
                 height: 10,
               ),
               CartProductCard(
                 product: ProductModel.products[0],
               ),
               CartProductCard(
                 product: ProductModel.products[3],
               ),
               CartProductCard(
                 product: ProductModel.products[2],
               ),
             ],
           ),
            Column(
              children: [
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUBTOTAL",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\$5.90',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DELIVERY FEE",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\$2.50',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$13.40',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
