import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medusa/model/models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStartedToState);
    on<CartProductAdded>(_mapCartProductAddedToState);
    on<CartProductRemoved>(_mapCartProductRemovedToState);
  }

  Future<void> _mapCartStartedToState(
      CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {}
  }

  Future<void> _mapCartProductAddedToState(
      CartProductAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: CartModel(
                products: List.from(state.cart.products)..add(event.product))));
      } catch (_) {}
    }
  }

  Future<void> _mapCartProductRemovedToState(
      CartProductRemoved event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: CartModel(
                products: List.from(state.cart.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
