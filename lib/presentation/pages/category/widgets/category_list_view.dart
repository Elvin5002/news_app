import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentation/cubit/category/category_cubit.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

String categoryName = 'General';

List<String> categoriesList = [
  'General',
  'Entertainment',
  'Health',
  'Sports',
  'Business',
  'Technology'
];

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              categoryName = categoriesList[i];
              setState(() {});

              context.read<CategoryCubit>().fetchCategories(categoryName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: categoryName == categoriesList[i]
                      ? Colors.blue.shade400
                      : Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                      child: Text(
                    categoriesList[i],
                    style: GoogleFonts.poppins(fontSize: 15, color: Colors.white)
                ),
              ),
            ),
            ))
          );
        },
      ),
    );
  }
}
