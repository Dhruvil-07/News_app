import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/channel_headline_model.dart';
import 'package:news_app/view/new_detail_screen.dart';

import '../model/categoies_healine_model.dart';


class ccategory_design extends StatelessWidget {

  CategoryModel  categoryModel;

  ccategory_design({ required this.categoryModel , super.key});

  @override
  Widget build(BuildContext context) {

    //date formatter
    final formate = DateFormat("dd-mm-yyyy");

    //conver string to date time
    DateTime date = DateTime.parse(categoryModel.publishedAt.toString());

    //final date
    String dat_val  = formate.format(date);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 16.h,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => category_new_detail_screen(categoryModel: categoryModel, date: dat_val),));
        },
        child: Container(
          height: 150.h,
          width: double.infinity,
          child: Row(
            children: [

              Expanded(
                child: Container(
                  height: 140.h,
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.spMin),
                    child: Image.network(
                       categoryModel.urlToImage.toString(),
                        fit: BoxFit.fitHeight,
                        /*"https://th.bing.com/th/id/OIG.ey_KYrwhZnirAkSgDhmg"*/
                    ),
                  ),
                ),
              ),


              SizedBox(width: 8.w,),

              Expanded(
                flex: 2,
                child: Container(
                   child:  Column(
                     children: [

                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SizedBox(
                           height: 100.h,
                           child: SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             child: Text(categoryModel.title.toString(),
                               style: GoogleFonts.lato(
                                 color: Colors.black,
                                 fontSize: 18.spMin,
                                 fontWeight: FontWeight.bold,
                                 wordSpacing: 2.0,
                               ),
                             ),
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

                              Expanded(
                                child: SizedBox(
                                   child: SingleChildScrollView(
                                     scrollDirection: Axis.horizontal,
                                     child: Text(categoryModel.source!.name.toString() ,
                                       style: GoogleFonts.alegreya(
                                         color: Colors.black,
                                         fontSize: 18.spMin,
                                         fontWeight: FontWeight.bold,
                                         wordSpacing: 2.0,
                                       ),
                                     ),
                                   ),
                                 ),
                              ),


                             Expanded(
                               child: SizedBox(
                                 child: SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Text( dat_val,
                                     style: GoogleFonts.alegreya(
                                       color: Colors.black,
                                       fontSize: 18.spMin,
                                       fontWeight: FontWeight.bold,
                                       wordSpacing: 2.0,
                                     ),
                                   ),
                                 ),
                               ),
                             ),

                           ],
                         ),
                       )

                     ],
                   ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

