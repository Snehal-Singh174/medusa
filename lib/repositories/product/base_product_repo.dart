import 'package:medusa/model/models.dart';

abstract class BaseProductRepo {
  Stream<List<ProductModel>> getAllProducts();
}
