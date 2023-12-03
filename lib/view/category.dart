import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Status/Status.drat.dart';
import 'package:news_app/instances/instances.dart';
import 'package:news_app/main.dart';
import 'package:news_app/view/category_design.dart';
import 'package:news_app/view/new_detail_screen.dart';

class category_screen extends StatefulWidget {
  const category_screen({super.key});

  @override
  State<category_screen> createState() => _category_screenState();
}

class _category_screenState extends State<category_screen> {

  //category list
  List<String> category_names = [
    "general" , "Entertainment" , "sports" , "Business" , "Technology" ,"Helth"
  ];

  //current index
  int current_index = 0;

  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      get_news_headlines.catergories_headlines();
    }


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),

      body: SizedBox(
        height: double.infinity,
        width:double.infinity,
        child: Column(
          children: [

            SizedBox(height: 8.h,),

            Container(
               height: 50.h,
               width: double.infinity,
                 child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                     itemCount: category_names.length,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal:8.w,
                           vertical: 8.h,
                         ),
                         child: InkWell(
                           onTap: (){
                             setState(() {
                               current_index = index;
                               get_news_headlines.catergories_headlines(category_names[current_index]);
                             });
                           },
                           child: Container(
                             height: 50.h,
                             width: 100.w,
                             decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepPurple.shade300),
                                borderRadius: BorderRadius.circular(30.0),
                                color: index == current_index ? Colors.deepPurple.shade300 : Colors.deepPurple.shade100,
                             ),
                             child: Center(child: Text(category_names[index],
                              style: GoogleFonts.alegreya(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                             )),
                           ),
                         ),
                       );
                     }
                 ),
              ),

            SizedBox(height: 4.h,),

            Expanded(
              flex: 4,
              child: Container(
                    child: Obx(
                      (){
                        switch(request_status.RxRequestStatus.value)
                        {
                          case Status.Loading:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                            break;

                          case Status.Error :
                            return Center(child: Text("ERROR..."),);
                            break;

                          case Status.Complate:
                            return ListView.builder(
                            shrinkWrap: true,
                            itemCount: get_news_headlines.categories_healine_data.length,
                            itemBuilder: (context, index) {
                                return ccategory_design(categoryModel: get_news_headlines.categories_healine_data[index],);
                            },
                          );
                            break;
                        }
                      }
                    ),
                  ),
              ),

          ],
        ),
      )
    );
  }
}
