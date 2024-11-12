import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import '../../../../core/utilities/extensions/context_extension.dart';
import '../../../../core/utilities/extensions/sizedbox_extension.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, this.articles});

  final ArticleEntity? articles;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM dd, yyyy');
    DateTime time = DateTime.parse(articles!.publishedAt.toString());
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: context.fullHeight * 0.2,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: context.fullWidth * .8,
              child: Text(
                articles!.title.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            15.h,
            SizedBox(
              width: context.fullWidth * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    articles!.source.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    format.format(time),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
