import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay/pay.dart';

import '../config/constants.dart';
import '../model/product_model.dart';

class GooglePay extends StatelessWidget {
  final String total;
  final List<ProductModel> products;

  const GooglePay({Key? key, required this.total, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _paymentItems = products
        .map(
          (product) => PaymentItem(
              label: product.name,
              amount: product.price.toString(),
              type: PaymentItemType.item,
              status: PaymentItemStatus.final_price),
        )
        .toList();

    _paymentItems.add(PaymentItem(
        label: 'Total',
        amount: total,
        type: PaymentItemType.item,
        status: PaymentItemStatus.final_price));

    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
        paymentConfiguration:
            PaymentConfiguration.fromJsonString(defaultGooglePayConfigString),
        onPaymentResult: onGooglePayResult,
        paymentItems: _paymentItems,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const CircularProgressIndicator(),
      ),
    );
  }
}
