import 'package:dartz/dartz.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/service_locator.dart';

import '../repository/article_repository.dart';

class GetNewsUsecase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<ArticleRepository>().getNews(params!);
  }
}
