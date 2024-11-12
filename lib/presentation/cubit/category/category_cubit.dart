import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/article_entity.dart';

import '../../../service_locator.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void fetchCategories(String category) async {
    try {
      emit(CategoryLoading());
      final categories =
          await sl<GetCategoriesUsecase>().call(params: category);
      categories.fold(
        (error) {
          log('Cat err $error');
          emit(CategoryFailure());
        },
        (data) {
          emit(CategorySuccess(data));
        },
      );
    } catch (e) {
      log('Categor cub $e');
      emit(CategoryFailure());
    }
  }
}
