import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/news_channel_headlines_model.dart';
import 'package:news_app/data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  NewsRepository newsRepository = NewsRepository();

  void fetchNewsChannelHeadlinesApi(String newsChannel) async{
    try {
      emit(NewsLoading());
      final headlines = await newsRepository.fetchNewsChannelHeadlinesApi(newsChannel);
      emit(NewsSuccess(headlines));
    } catch(e) {
      emit(NewsFailure());
    }
  }

  
}
