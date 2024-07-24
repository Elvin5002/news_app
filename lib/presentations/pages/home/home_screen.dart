import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../details/news_channel_detail_screen.dart';
import '../../../utilities/extensions/sizedbox_extension.dart';
import '../../../cubits/category/category_cubit.dart';
import '../../../utilities/extensions/context_extension.dart';
import '../details/news_category_details_screen.dart';
import 'widgets/card_view.dart';
import 'widgets/image_view.dart';
import '../../../cubits/channels/news_cubit.dart';
import 'widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM dd, yyyy');
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: context.fullHeight * 0.55,
            width: context.fullWidth,
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if(state is NewsSuccess) {
                final news = state.news;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: news.articles!.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 2,
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsChannelDetailScreen(articles: news.articles![i],)));
                        },
                        child: SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ImageView(articles: news.articles![i],),
                              Positioned(
                                bottom: 20,
                                child: CardView(articles: news.articles![i],),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }else{
                return const SizedBox.shrink();
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is CategorySuccess){
                      final news = state.news;
                      return ListView.builder(
                        itemCount: news.articles!.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, i) {
                          DateTime time = DateTime.parse(news.articles![i].publishedAt.toString());
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsCategoryDetailsScreen(articles: news.articles![i],)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: news.articles![i].urlToImage.toString(),
                                      height: context.fullHeight * .18,
                                      width: context.fullWidth * .3,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, error, stackTrace) {
                                        return Text('Failed to load image');
                                      }),
                                  ),
                                  10.w,
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            news.articles![i].title ?? 'Not defined',
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w700),
                                          ),
                                          10.h,
                                          Text(
                                            news.articles![i].source!.name?? 'Not defined',
                                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
                                          ),
                                          5.h,
                                          Text(
                                            format.format(time),
                                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
          ),
        ],
      ),
    );
  }
}
