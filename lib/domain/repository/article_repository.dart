import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either> getNews(String newsChannel);
  Future<Either> getCategories(String category);
}
