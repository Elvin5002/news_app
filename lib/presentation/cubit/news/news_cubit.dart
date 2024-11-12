import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/article_entity.dart';

import '../../../service_locator.dart';
import '../../../domain/usecases/get_news_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void fetchNewsChannelHeadlinesApi(String newsChannel) async {
    try {
      emit(NewsLoading());
      final result = await sl<GetNewsUsecase>().call(params: newsChannel);
      result.fold(
        (failure) {
          log('$failure');
          emit(NewsFailure());
        },
        (data) {
          emit(NewsSuccess(data));
        },
      );
    } catch (e) {
      log('$e');
      emit(NewsFailure());
    }
  }
}
