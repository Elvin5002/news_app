import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubits/category/category_cubit.dart';
import 'package:news_app/cubits/channels/news_cubit.dart';
import '../home/home_screen.dart';
import '../../../utilities/extensions/sizedbox_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => NewsCubit()
                          ..fetchNewsChannelHeadlinesApi('bbc-news'),
                      ),
                      BlocProvider(
                        create: (context) => CategoryCubit()..fetchCategories('general'),
                      ),
                    ],
                    child: HomeScreen(),
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height * .5,
              width: width * .9,
            ),
            (height * .04).h,
            Text(
              'TOP HEADLINES',
              style: GoogleFonts.anton(
                  letterSpacing: .06, color: Colors.grey.shade700),
            ),
            (height * .04).h,
            const SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
