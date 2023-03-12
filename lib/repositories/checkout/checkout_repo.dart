import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medusa/model/checkout_model.dart';

import 'base_checkout_repo.dart';

class CheckoutRepo extends BaseCheckoutRepo {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(CheckoutModel checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
