
import 'package:news_app/data/models/news_categories_model.dart';
import 'package:news_app/data/models/news_channel_headlines_model.dart';
import 'package:news_app/data/repositories/news_repository.dart';

class NewsViewModel {
  final _repo = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String newsChannel) async{
    final response = await _repo.fetchNewsChannelHeadlinesApi(newsChannel);
    return response;
  }

  Future<NewsCategoriesModel> fetchNewsCategoriesApi(String category) => _repo.fetchNewsCategoriesApi(category);
} 