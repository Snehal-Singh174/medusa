import 'package:hive/hive.dart';

import '../../model/models.dart';

abstract class BaseLocalStorageRepo{
  Future<Box> openBox();
  List<ProductModel> getWishlist(Box box);
  Future<void> addProductToWishlist(Box box, ProductModel product);
  Future<void> removeProductFromWishlist(Box box, ProductModel product);
  Future<void> clearWishlist(Box box);
}