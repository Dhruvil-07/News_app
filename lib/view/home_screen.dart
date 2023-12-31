import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Status/Status.drat.dart';
import 'package:news_app/instances/instances.dart';
import 'package:news_app/model/channel_headline_model.dart';
import 'package:news_app/view/category.dart';
import 'package:news_app/view/category_design.dart';
import 'package:news_app/view/new_detail_screen.dart';

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
    get_news_headlines.channel_headlines();
    //get_news_headlines.country_headlines();
    get_news_headlines.catergories_headlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //app bar
      appBar: AppBar(
        title: Center(child: Text("News",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold
           ),
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0.1,
        leading: IconButton(
          icon: Icon(Icons.category, color: Colors.black,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>category_screen()));
          },
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu , color: Colors.black,),
            onSelected: (value) {
               get_news_headlines.channel_headlines(value);
              },
              itemBuilder: (context) {
                return [

                  PopupMenuItem(
                      value: "bbc-News",
                      child: Text("bbcNews"),
                  ),
                  PopupMenuItem(
                      value: "ary-news",
                      child: Text("aryNews"),
                  ),
                  PopupMenuItem(
                      value: "independent",
                      child: Text("independent"),
                  ),
                  PopupMenuItem(
                      value: "reuters",
                      child: Text("reuters"),
                  ),
                  PopupMenuItem(
                      value: "cnn",
                      child: Text("cnn"),
                  ),
                  PopupMenuItem(
                      value: "al-jazeera-english",
                      child: Text("alJazeera"),
                  ),

                ];
              },
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: ListView(
          children: [

            //top channel headlines
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              width: double.infinity,
              child: Obx(
                () {
                  switch(request_status.RxRequestStatus.value)
                  {
                    case Status.Loading :
                      return Center(child: CircularProgressIndicator(),);
                      break;

                    case Status.Error :
                      return Center(child: Text("Error"),);
                      break;

                    case Status.Complate :
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount : get_news_headlines.channel_headline_data.length,
                        itemBuilder: (context, index){
                          return channel_headline_design(
                            channelHeaddlineModel: get_news_headlines.channel_headline_data[index],
                          );
                        }
                      );
                  }
                },
              ),
            ),

            //category design
            SizedBox(
              height: 500.h,
              width: double.infinity,
              child: Obx(
                () {
                  switch(request_status.RxRequestStatus.value)
                  {
                    case Status.Loading :
                      return Center(child: CircularProgressIndicator(),);
                      break;

                    case Status.Error :
                      return Center(child: Text("ERROR..."),);
                      break;

                    case Status.Complate :
                      return ListView.builder(
                        itemCount : get_news_headlines.categories_healine_data.length,
                        itemBuilder: (context, index){
                          return ccategory_design(categoryModel: get_news_headlines.categories_healine_data[index],);
                        },
                      );
                  }
                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}




//Channel headline widget
class channel_headline_design extends StatelessWidget {

  ChannelHeaddlineModel channelHeaddlineModel;

   channel_headline_design({
    required this.channelHeaddlineModel,
    super.key});

  @override
  Widget build(BuildContext context) {

    //date formater
    final formate = DateFormat("dd-mm-yyyy");

    //convert string into datetime type
    DateTime date = DateTime.parse(channelHeaddlineModel.publishedAt.toString());

    //formate date
    final date_val = formate.format(date);

    print(date_val);

    return Stack(
      children: [

        //background image
        InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => channel_news_detail_screen(channelHeaddlineModel: channelHeaddlineModel , date: date_val,)));
          },
          child: Container(
            height: 350.h,
            width: 250.w,
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 2.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.spMin),
              child: Image.network("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D",
              fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),

        //detail card
        Positioned(
          bottom: 50.h,
          left: 16.w,
          right: 16.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.spMin),
              border: Border.all(color: Colors.black , width: 2.0)
            ),
            height: 130.h,
            width: 210.w,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(channelHeaddlineModel.title.toString(),
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2.0,
                    ),
                  ),
                ),

                Spacer(),


                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(channelHeaddlineModel.source!.name.toString(),
                        style: GoogleFonts.alegreya(
                          color: Colors.black,
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2.0,
                        ),
                      ),

                      Text(date_val.toString(),
                        style: GoogleFonts.alegreya(
                          color: Colors.black,
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2.0,
                        ),
                      ),

                    ],
                  ),
                )

              ],
            ),
          ),
        )


      ],
    );
  }
}


