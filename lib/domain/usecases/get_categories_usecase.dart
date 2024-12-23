import 'package:dartz/dartz.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/domain/repository/article_repository.dart';
import 'package:news_app/service_locator.dart';

class GetCategoriesUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<ArticleRepository>().getCategories(params!);
  }
}