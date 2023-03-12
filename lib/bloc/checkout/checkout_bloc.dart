import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medusa/model/models.dart';
import 'package:meta/meta.dart';

import '../../repositories/checkout/checkout_repo.dart';
import '../cart/cart_bloc.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepo _checkoutRepo;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({required CartBloc cartBloc, required CheckoutRepo checkoutRepo})
      : _cartBloc = cartBloc,
        _checkoutRepo = checkoutRepo,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                product: (cartBloc.state as CartLoaded).cart.products,
                subTotal: (cartBloc.state as CartLoaded).cart.subTotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
    on<UpdateCheckout>(_mapUpdateCheckoutToState);
    on<ConfirmCheckout>(_mapConfirmCheckoutToState);
  }

  Future<void> _mapUpdateCheckoutToState(
      UpdateCheckout event, Emitter<CheckoutState> emit) async {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        product: event.cart?.products ?? state.product,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        subTotal: event.cart?.subTotalString ?? state.subTotal,
        total: event.cart?.totalString ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode
      ));
    }
  }

  Future<void> _mapConfirmCheckoutToState(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    _checkoutSubscription?.cancel();
    if(state is CheckoutLoaded) {
      try {
        await _checkoutRepo.addCheckout(event.checkout!);
        print("Done");
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }
}
