part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable{
  const WishlistEvent();

  @override
  List<Object> get props => [ ];
}

class StarWishlist extends WishlistEvent{}

class AddWishlistProduct extends WishlistEvent{
  final ProductModel product;

  const AddWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent{
  final ProductModel product;

  const RemoveWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}
