import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../config/constants.dart';
import '../model/product_model.dart';


class ApplePay extends StatelessWidget {
  final String total;
  final List<ProductModel> products;

  const ApplePay({Key? key, required this.total, required this.products})
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

    void onApplePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ApplePayButton(
        paymentConfiguration: PaymentConfiguration.fromJsonString(
            defaultApplePayConfigString),
        paymentItems: _paymentItems,
        style: ApplePayButtonStyle.black,
        type: ApplePayButtonType.buy,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: onApplePayResult,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
