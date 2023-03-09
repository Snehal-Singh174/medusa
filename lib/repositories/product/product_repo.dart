import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medusa/model/product_model.dart';
import 'package:medusa/repositories/product/base_product_repo.dart';

class ProductRepo extends BaseProductRepo {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getAllProducts() {
    return _firebaseFirestore.collection('product').snapshots().map((snapshot) {
      return snapshot.docs
          .map((snap) => ProductModel.fromSnapShot(snap))
          .toList();
    });
  }
}
