part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartProductAdded extends CartEvent {
  final ProductModel product;

  const CartProductAdded(this.product);

  @override
  List<Object?> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final ProductModel product;

  const CartProductRemoved(this.product);

  @override
  List<Object?> get props => [product];
}
