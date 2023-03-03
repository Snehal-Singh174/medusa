import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medusa/model/models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StarWishlist>(_mapStarWishlistToState);
    on<AddWishlistProduct>(_mapAddWishlistProductToState);
    on<RemoveWishlistProduct>(_mapRemoveWishlistProductToState);
  }

  void _mapStarWishlistToState(StarWishlist event, Emitter<WishlistState> emit) {}
  void _mapAddWishlistProductToState(AddWishlistProduct event, Emitter<WishlistState> emit) {}
  void _mapRemoveWishlistProductToState(RemoveWishlistProduct event, Emitter<WishlistState> emit) {}
}
