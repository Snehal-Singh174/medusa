import 'package:flutter/material.dart';
import 'package:medusa/widgets/widgets.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => OrderConfirmationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order Confirmation',
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  color: Colors.black,
                  width: double.infinity,
                ),
                Positioned(
                    top: 105,
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    child: Image.asset(
                      'assets/order-confirm.png',
                      color: Colors.white,
                      height: 120,
                      width: 120,
                    )),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is complete',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER CODE: #k3421-f876',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Thank you for purchasing on medusa',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'ORDER CODE: #k3421-f876',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  OrderSummary(),
                  SizedBox(height: 20,),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Divider(thickness: 2,),
                  SizedBox(height: 5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
