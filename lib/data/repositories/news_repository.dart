import 'package:dio/dio.dart';
import 'package:news_app/data/models/news_categories_model.dart';
import 'package:news_app/data/models/news_channel_headlines_model.dart';

class NewsRepository {
  final Dio dio = Dio();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String newsChannel) async{

    try{
      String newsUrl = 'https://newsapi.org/v2/top-headlines?sources=$newsChannel&apiKey=8a5ec37e26f845dcb4c2b78463734448';
      //String country = 'https://newsapi.org/v2/top-headlines?country=tr&apiKey=8a5ec37e26f845dcb4c2b78463734448';
      /*final response = await http.get(Uri.parse(newsUrl));
      https://newsapi.org/v2/everything?q=Apple&from=2024-07-22&sortBy=popularity&apiKey=API_KEY
      https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        return NewsChannelHeadlinesModel.fromJson(body);
      }*/

      final response = await dio.get(newsUrl);

      if(response.statusCode == 200){
        return NewsChannelHeadlinesModel.fromJson(response.data);
      }
      throw Exception();

    }catch(e){
      throw Exception(e);
    }
    
  }

  Future<NewsCategoriesModel> fetchNewsCategoriesApi(String category) async{
    try {
      String endpoint = 'https://newsapi.org/v2/everything?q=${category}&apiKey=76c8b8eb0d4d4630bfaf28b84d1cd610';

      final response = await dio.get(endpoint);

      if(response.statusCode == 200){
        return NewsCategoriesModel.fromJson(response.data);
      }
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }

  }


}