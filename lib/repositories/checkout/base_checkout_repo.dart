import '../../model/models.dart';

abstract class BaseCheckoutRepo {
  Future<void> addCheckout(CheckoutModel checkout);
}