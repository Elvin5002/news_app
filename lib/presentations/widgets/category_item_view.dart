import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../utilities/extensions/context_extension.dart';
import '../../utilities/extensions/sizedbox_extension.dart';
import '../../data/models/news_categories_model.dart';
import '../pages/details/news_category_details_screen.dart';

class CategoryItemView extends StatelessWidget {
  CategoryItemView({super.key, required this.articles});

  final format = DateFormat('MMMM dd, yyyy');
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(articles.publishedAt.toString());
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsCategoryDetailsScreen(
                      articles: articles,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                  imageUrl: articles.urlToImage.toString(),
                  height: context.fullHeight * .18,
                  width: context.fullWidth * .3,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) {
                    return Text('Failed to load image');
                  }),
            ),
            15.h,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articles.title ?? 'Not defined',
                      maxLines: 3,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700),
                    ),
                    10.h,
                    Text(
                      articles.source!.name ?? 'Not defined',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    5.h,
                    Text(
                      format.format(time),
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
