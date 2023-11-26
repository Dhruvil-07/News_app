import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/category.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/splashh_screen.dart';

void main()
{
   runApp(news_app());
}


class news_app extends StatelessWidget {
  const news_app({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splash_screen(),
      ),
    );
  }
}
