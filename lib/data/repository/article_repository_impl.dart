import 'package:dartz/dartz.dart';

import 'package:news_app/service_locator.dart';

import '../../domain/repository/article_repository.dart';
import '../services/news_api_service.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<Either> getNews(String newsChannel) async {
    return await sl<NewsApiService>().getNews(newsChannel);
  }

  @override
  Future<Either> getCategories(String category) {
    return sl<NewsApiService>().getCategories(category);
  }
}
