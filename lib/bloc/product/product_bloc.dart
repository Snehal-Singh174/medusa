import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:medusa/model/models.dart';
import '../../repositories/product/product_repo.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepo productRepo})
      : _productRepo = productRepo,
        super(ProductLoading()) {
    on<LoadProducts>(_mapLoadProductsToState);
    on<UpdateProducts>(_mapUpdateProductsToState);
  }

  Future<void> _mapLoadProductsToState(
      LoadProducts event, Emitter<ProductState> emit) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepo.getAllProducts().listen(
          (products) => add(
            UpdateProducts(products),
          ),
        );
  }

  Future<void> _mapUpdateProductsToState(
      UpdateProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: event.products));
  }
}
