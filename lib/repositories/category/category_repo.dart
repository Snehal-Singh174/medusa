import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medusa/model/category_model.dart';
import 'package:medusa/repositories/category/base_category_repo.dart';

class CategoryRepo extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<CategoryModel>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((snap) => CategoryModel.fromSnapShot(snap))
          .toList();
    });
  }
}
