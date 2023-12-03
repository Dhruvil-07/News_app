import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/channel_headline_model.dart';

import '../model/categoies_healine_model.dart';

class channel_news_detail_screen extends StatelessWidget {

  ChannelHeaddlineModel channelHeaddlineModel;
  String date;

  channel_news_detail_screen({required this.channelHeaddlineModel , required this.date});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back , color: Colors.black),
        ),
      ),


      body: SizedBox(
        height:double.infinity,
        width: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [

                Container(
                  height: height * .40 ,
                  child: Image.network(channelHeaddlineModel.urlToImage.toString() ,
                    fit: BoxFit.fill,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: height * 0.40),
                  padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 8.0),
                  height: height,
                  child: Column(
                      children: [

                        Text(channelHeaddlineModel.title.toString() ,
                         style: GoogleFonts.alegreya(
                           color: Colors.black,
                           fontSize: 27.0,
                           fontWeight: FontWeight.bold,
                         ),
                        ),

                        SizedBox(height: 20.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text(channelHeaddlineModel.source!.name.toString(),
                             style: GoogleFonts.cabin(
                               fontWeight: FontWeight.bold,
                               color: Colors.blue,
                               fontSize: 20.0,
                             ),
                            ),


                            Text(date,
                              style: GoogleFonts.cabin(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20.0,
                              ),
                            ),


                            
                          ],
                        ),

                        SizedBox(height: 30.h,),

                        Text(channelHeaddlineModel.description.toString() ,
                         style: GoogleFonts.cabin(
                           color: Colors.black,
                           fontSize:22.0,
                           fontWeight: FontWeight.w500,
                         ),
                        ),

                        SizedBox(height: 20.h,),

                        Text(channelHeaddlineModel.content.toString() ,
                          style: GoogleFonts.cabin(
                            color: Colors.black,
                            fontSize:22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 30.h,),

                        Text( "Author :- ${channelHeaddlineModel.author.toString()}" ,
                          style: GoogleFonts.alegreya(
                            color: Colors.blue,
                            fontSize: 27.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                )

              ],
            ),
          ),
        ),

    );
  }
}



class category_new_detail_screen extends StatelessWidget {
  category_new_detail_screen({ required this.categoryModel , required this.date , super.key});

  CategoryModel categoryModel;
  String date;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back , color: Colors.black),
        ),
      ),


      body: SizedBox(
        height:double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Container(
                height: height * .40 ,
                child: Image.network(categoryModel.urlToImage.toString() ,
                  fit: BoxFit.fill,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: height * 0.40),
                padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 8.0),
                height: height,
                child: Column(
                  children: [

                    Text(categoryModel.title.toString() ,
                      style: GoogleFonts.alegreya(
                        color: Colors.black,
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(categoryModel.source!.name.toString(),
                          style: GoogleFonts.cabin(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20.0,
                          ),
                        ),


                        Text(date,
                          style: GoogleFonts.cabin(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 20.0,
                          ),
                        ),



                      ],
                    ),

                    SizedBox(height: 30.h,),

                    Text(categoryModel.description.toString() ,
                      style: GoogleFonts.cabin(
                        color: Colors.black,
                        fontSize:22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Text(categoryModel.content.toString() ,
                      style: GoogleFonts.cabin(
                        color: Colors.black,
                        fontSize:22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 30.h,),

                    Text( "Author :- ${categoryModel.author.toString()}" ,
                      style: GoogleFonts.alegreya(
                        color: Colors.blue,
                        fontSize: 27.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}

