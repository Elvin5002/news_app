part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<ArticleEntity> news;

  CategorySuccess(this.news);
}

final class CategoryFailure extends CategoryState {}
