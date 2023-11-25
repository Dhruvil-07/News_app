import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/Status/Status.drat.dart';
import 'package:news_app/instances/instances.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get_news_headlines.channel_headlines();
    //get_news_headlines.country_headlines();
    get_news_headlines.catergories_headlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Obx(
                    (){
                  switch(request_status.RxRequestStatus.value)
                  {
                    case Status.Loading :
                      return CircularProgressIndicator();
                      break;

                    case Status.Error :
                      return Center(child: Text("Error"),);
                      break;

                    case Status.Complate :
                      return Center(child: Text("Data is Done..."),);
                      break;
                  }
                }
            ),



            SizedBox(height: 20.h,),

            Obx(
                    (){
                  switch(request_status.RxRequestStatus.value)
                  {
                    case Status.Loading :
                      return CircularProgressIndicator();
                      break;

                    case Status.Error :
                      return Center(child: Text("Error"),);
                      break;

                    case Status.Complate :
                      return Center(child: Text("Data is Done..."),);
                      break;
                  }
                }
            ),


          ],
        ),
      )


    );
  }
}
