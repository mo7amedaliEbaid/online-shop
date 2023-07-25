import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../repositories/category/category_repos.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepos _categoryRepos;
  StreamSubscription? _categorySubscription;
  CategoryBloc({required CategoryRepos categoryRepos})
      : _categoryRepos = categoryRepos,
        super(CategoryLoading()) {
    on<LoadCategories>(_mapLoadCategoriesToState);
    on<UpdateCategories>(_mapUpdateCategoriesToState);
  }

  FutureOr<void> _mapUpdateCategoriesToState(
      UpdateCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: event.categories));
  }

  FutureOr<void> _mapLoadCategoriesToState(
      LoadCategories event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepos.getAllCategories().listen(
      (categories) {
        add(
          UpdateCategories(categories),
        );
      },
    );
  }
}
