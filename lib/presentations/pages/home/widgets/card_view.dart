import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../utilities/extensions/context_extension.dart';
import '../../../../utilities/extensions/sizedbox_extension.dart';
import '../../../../data/models/news_channel_headlines_model.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key, this.articles}) : super(key: key);

  final Articles? articles;

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
            Container(
              width: context.fullWidth * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    articles!.source!.name.toString(),
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
