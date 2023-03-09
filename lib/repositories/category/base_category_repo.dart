import 'package:medusa/model/category_model.dart';

abstract class BaseCategoryRepo {
  Stream<List<CategoryModel>> getAllCategories();
}
