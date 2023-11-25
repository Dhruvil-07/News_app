import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/view/home_screen/home_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 5 ), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_screen(),));
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [

            SizedBox(height: 80.h,),

            Container(
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              child: Image.network("https://t3.ftcdn.net/jpg/00/88/43/58/360_F_88435823_c3MiOAvV8gFwtQzTGlsLt6I6mFvQuQmN.jpg",
                fit :  BoxFit.contain,
              )
            ),

            SizedBox(height: 80.h,),

            SpinKitSpinningLines(
              color: Colors.red,
            ),

          ],
        ),
      ),
    );
  }
}
