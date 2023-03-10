part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;

  CategoryLoaded({this.categories = const <CategoryModel>[]});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {}
