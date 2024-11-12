part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<ArticleEntity> news;

  NewsSuccess(this.news);
}

final class NewsFailure extends NewsState {}