import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../cubits/category/category_cubit.dart';
import '../../widgets/category_item_view.dart';
import 'widgets/category_list_view.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const CategoryListView(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is CategorySuccess){
                      final news = state.news;
                      return ListView.builder(
                        itemBuilder: (context, i) {
                          return CategoryItemView(articles: news.articles![i]);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            )
          ],
        ));
  }
}
