import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/view%20models/news_view_model.dart';
import '../../data/models/news_categories_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final _viewModel = NewsViewModel();

  void fetchCategories(String category) async {
    try {
      emit(CategoryLoading());
      final categories = await _viewModel.fetchNewsCategoriesApi(category);
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure());
    }
    
  }
}
