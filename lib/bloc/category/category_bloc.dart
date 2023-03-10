import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:medusa/model/models.dart';
import '../../repositories/category/category_repo.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo _categoryRepo;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepo categoryRepo})
      : _categoryRepo = categoryRepo,
        super(CategoryLoading()) {
    on<LoadCategories>(_mapLoadCategoriesToState);
    on<UpdateCategories>(_mapUpdateCategoriesToState);
  }

  Future<void> _mapLoadCategoriesToState(
      LoadCategories event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepo.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  Future<void> _mapUpdateCategoriesToState(
      UpdateCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: event.categories));
  }
}
