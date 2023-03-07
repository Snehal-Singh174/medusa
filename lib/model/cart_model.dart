import 'package:equatable/equatable.dart';
import 'package:medusa/model/product_model.dart';

class CartModel extends Equatable {
  final List<ProductModel> products;

  const CartModel({this.products = const <ProductModel>[]});

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 30.0) {
      return "You have Free Delivery";
    } else {
      double missing = 30.0 - subTotal;
      return "Add \$${missing.toStringAsFixed(2)} for Free Delivery";
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  Map productQuantity(products) {
    var quantity = Map();
    
    products.forEach((product) {
      if(!quantity.containsKey(product)){
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }
  
  @override
  List<Object?> get props => [products];
}
