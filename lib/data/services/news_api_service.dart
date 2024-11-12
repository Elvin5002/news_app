import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../model/article_model.dart';

abstract class NewsApiService {
  Future<Either> getNews(String newsChannel);
  Future<Either> getCategories(String category);
}

class NewsApiServiceImpl extends NewsApiService {
  final Dio _dio = Dio();
  @override
  Future<Either> getNews(String newsChannel) async {
    try {
      final url =
          'https://newsapi.org/v2/top-headlines?sources=$newsChannel&apiKey=76c8b8eb0d4d4630bfaf28b84d1cd610';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final articlesJson = response.data['articles'] as List;

        final articles = articlesJson.map((json) => ArticleModel.fromJson(json)).toList();
        //log('$articles');
        final articesEntity = articles.map((model) => model.toEntity()).toList();
        return Right(articesEntity);
      }
      return Left(Exception('Error occured when fetch news'));
    } catch (e) {
      log('$e');
      return Left(Exception('Error occured when fetch news'));
    }
  }

  @override
  Future<Either> getCategories(String category) async {
    try {
      String endpoint =
          'https://newsapi.org/v2/everything?q=$category&apiKey=76c8b8eb0d4d4630bfaf28b84d1cd610';
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        final categoryJson = response.data['articles'] as List;

        final categories = categoryJson.map((json) => ArticleModel.fromJson(json)).toList();
        final categoriesEntity = categories.map((model) => model.toEntity()).toList();
        
        return Right(categoriesEntity);
      }
      return Left(Exception('Error occured when fetch categories'));
    } catch (e) {
      log('Caregory $e');
      return Left(Exception('Error occured when fetch categories'));
    }
  }
}
