import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubits/category/category_cubit.dart';
import 'package:news_app/cubits/channels/news_cubit.dart';
import 'package:news_app/presentations/pages/category/category_screen.dart';

enum FilterList { bbcNews, cnn, reuters, alJazeera }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    FilterList? selectedMenu;
    String name = 'bbc-news';

    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => CategoryCubit()..fetchCategories('general'),
                          child: CategoryScreen(),
                        )));
          },
          icon: Image.asset(
            'images/category_icon.png',
            height: 30,
            width: 30,
          )),
      title: Text(
        'NEWS',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      actions: [
        PopupMenuButton<FilterList>(
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          initialValue: selectedMenu,
          onSelected: (FilterList item) {
            if (FilterList.bbcNews.name == item.name) {
              name = 'bbc-news';
            }
            if (FilterList.cnn.name == item.name) {
              name = 'cnn';
            }
            if (FilterList.reuters.name == item.name) {
              name = 'reuters';
            }
            if (FilterList.alJazeera.name == item.name) {
              name = 'al-jazeera-english';
            }

            context.read<NewsCubit>().fetchNewsChannelHeadlinesApi(name);
          },
          itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
            const PopupMenuItem(
                value: FilterList.bbcNews, child: Text('BBC News')),
            const PopupMenuItem(value: FilterList.cnn, child: Text('CNN')),
            const PopupMenuItem(
                value: FilterList.reuters, child: Text('Reuters')),
            const PopupMenuItem(
                value: FilterList.alJazeera, child: Text('Al Jazeera')),
          ],
        )
      ],
    );
  }
}
