import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/extensions/context_extension.dart';
import '../../../../data/models/news_channel_headlines_model.dart';

class ImageView extends StatelessWidget {
const ImageView({ Key? key, required this.articles }) : super(key: key);

  final Articles articles;

  @override
  Widget build(BuildContext context){
    return Container(
      height: context.fullHeight * 0.6,
      width: context.fullWidth * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: context.fullWidth * .02,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: articles.urlToImage.toString(),
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Text('Failed to load image');
          }),
      ),
    );
  }
}