part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded({this.products = const <ProductModel>[]});

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {}
