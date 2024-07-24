import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utilities/extensions/sizedbox_extension.dart';

import '../../../data/models/news_categories_model.dart';

class NewsCategoryDetailsScreen extends StatelessWidget {
const NewsCategoryDetailsScreen({ Key? key, required this.articles }) : super(key: key);

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM dd, yyyy');
    DateTime time = DateTime.parse(articles.publishedAt.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //height: context.fullHeight*.4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Text(
                    articles.title!,
                    style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700
                          )
                  ),
                  10.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        articles.source!.name!,
                        softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600),
                      ),
                      Text(
                        format.format(time),
                        style:  GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    ],
                  ),
                  20.h,
                  Text(articles.description!,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500
                      )
                  ),
                  20.h,
                  Text(articles.content!,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}