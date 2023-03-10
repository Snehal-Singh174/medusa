part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<CategoryModel> categories;

  UpdateCategories(this.categories);

  @override
  List<Object> get props => [categories];
}
