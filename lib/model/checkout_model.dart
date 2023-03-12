import 'package:equatable/equatable.dart';
import 'package:medusa/model/product_model.dart';

class CheckoutModel extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<ProductModel>? product;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;

  const CheckoutModel(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.product,
      required this.subTotal,
      required this.deliveryFee,
      required this.total});

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        product,
        subTotal,
        deliveryFee,
        total
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': product!.map((e) => e.name).toList(),
      'subTotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}
