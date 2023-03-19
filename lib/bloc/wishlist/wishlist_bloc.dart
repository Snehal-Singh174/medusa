import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:medusa/model/models.dart';

import '../../repositories/local_storage/local_storage_repo.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepo _localStorageRepository;

  WishlistBloc({required LocalStorageRepo localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<StartWishlist>(_mapStarWishlistToState);
    on<AddWishlistProduct>(_onAddProductToWishlist);
    on<RemoveWishlistProduct>(_onRemoveProductFromWishlist);
  }

  Future<void> _mapStarWishlistToState(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<ProductModel> products = _localStorageRepository.getWishlist(box);
      await Future.delayed(const Duration(seconds: 1));
      emit(
        WishlistLoaded(
          wishlist: WishlistModel(products: products),
        ),
      );
    } catch (_) {}
  }

  Future<void> _onAddProductToWishlist(
      AddWishlistProduct event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishlist(box, event.product);
        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from(state.wishlist.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }

  Future<void> _onRemoveProductFromWishlist(
      RemoveWishlistProduct event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductFromWishlist(box, event.product);
        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from(state.wishlist.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
