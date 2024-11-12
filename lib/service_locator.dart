import 'package:get_it/get_it.dart';

import 'data/repository/article_repository_impl.dart';
import 'data/services/news_api_service.dart';
import 'domain/repository/article_repository.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'domain/usecases/get_news_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<NewsApiService>(NewsApiServiceImpl());
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl());
  sl.registerSingleton<GetNewsUsecase>(GetNewsUsecase());
  sl.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());
}
