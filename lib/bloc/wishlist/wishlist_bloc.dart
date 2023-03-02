import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medusa/model/models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) {
      // TODO: implement event handler
      if(event is StarWishlist) {
        emit(_mapStarWishlistToState());
      } else if(event is AddWishlistProduct) {
        emit(_mapAddWishlistProductToState());
      } else if(event is RemoveWishlistProduct) {
        emit(_mapRemoveWishlistProductToState());
      }
    });
  }
}
