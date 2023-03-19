import 'package:hive/hive.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/repositories/local_storage/base_local_storage_repo.dart';

class LocalStorageRepo extends BaseLocalStorageRepo {
  String boxName = 'wishlist_products';

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<ProductModel>(boxName);
    return box;
  }

  @override
  List<ProductModel> getWishlist(Box box) {
    return box.values.toList() as List<ProductModel>;
  }

  @override
  Future<void> addProductToWishlist(Box box, ProductModel product) async{
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromWishlist(Box box, ProductModel product) async{
    await box.delete(product.id);
  }

  @override
  Future<void> clearWishlist(Box box) async{
    await box.clear();
  }
}
