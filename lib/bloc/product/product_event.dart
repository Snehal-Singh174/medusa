part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<ProductModel> products;

  UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}
