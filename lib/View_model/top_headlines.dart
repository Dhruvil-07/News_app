import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Status/Status.drat.dart';
import 'package:news_app/api_reponse_manage/api_response_manage.dart';
import 'package:news_app/instances/instances.dart';
import 'package:news_app/model/channel_headline_model.dart';
import 'package:news_app/model/country_headline_model.dart';

import '../model/categoies_healine_model.dart';

class Get_news_headlines extends GetxController
{

  //list of data form difffrent channnel
  RxList<ChannelHeaddlineModel> channel_headline_data = <ChannelHeaddlineModel>[].obs;

  //channel vise headdline
  Future<void> channel_headlines() async
  {
      //genrate link
      var channel_name = "abc-news";
      var url =  "https://newsapi.org/v2/top-headlines?sources=${channel_name}&apiKey=be4c0037164f4a5194991769d317d86d";

      //cear list
      channel_headline_data.clear();

      request_status.setRequestStatus(Status.Loading);
      var response_data = await api_response_manage.get_api(url)
      .then((value){
        request_status.setRequestStatus(Status.Complate);
        var decoded_data = jsonDecode(value.toString());
        var main_data = decoded_data["articles"];
        List.of(main_data).map((e){
          channel_headline_data.value.add(ChannelHeaddlineModel.fromJson(e));
        }).toList();
        print(channel_headline_data.length);
      })
      .onError((error, stackTrace) {
        request_status.setRequestStatus(Status.Error);
        print(error);
      });

     print(request_status.RxRequestStatus);
    }


    //list of data from diiferent country
  RxList<CountryHeallineModel> country_headline_data = <CountryHeallineModel>[].obs;

  //country vise headline
  Future<void> country_headlines() async
  {
    //genrate link
    var country_name = "in";
    var url = "https://newsapi.org/v2/top-headlines?country=${country_name}&apiKey=be4c0037164f4a5194991769d317d86d";

    //cear list
    country_headline_data.clear();

    request_status.setRequestStatus(Status.Loading);
    var response_data = await api_response_manage.get_api(url)
        .then((value){
      request_status.setRequestStatus(Status.Complate);
      var decoded_data = jsonDecode(value.toString());
      var main_data = decoded_data["articles"];
      List.of(main_data).map((e){
       country_headline_data.add(CountryHeallineModel.fromJson(e));
      }).toList();
      print(country_headline_data.length);
    })
        .onError((error, stackTrace) {
      request_status.setRequestStatus(Status.Error);
      print(error);
    });

    print(request_status.RxRequestStatus);
  }



  //list of data froom categories vise
  RxList<CategoryHedalineModel> categories_healine_data = <CategoryHedalineModel>[].obs;

  //categories vise headline
  Future<void> catergories_headlines() async
  {
    //genrate link
    var category_name = "business";
    var url = "https://newsapi.org/v2/top-headlines/sources?category=${category_name}&apiKey=be4c0037164f4a5194991769d317d86d";

    //cear list
    categories_healine_data.clear();

    request_status.setRequestStatus(Status.Loading);
    var response_data = await api_response_manage.get_api(url)
        .then((value){
      request_status.setRequestStatus(Status.Complate);
      var decoded_data = jsonDecode(value.toString());
      var main_data = decoded_data["sources"];
      List.of(main_data).map((e){
        categories_healine_data.add(CategoryHedalineModel.fromJson(e));
      }).toList();
      print(country_headline_data.length);
    })
        .onError((error, stackTrace) {
      request_status.setRequestStatus(Status.Error);
      print(error);
    });
    print(request_status.RxRequestStatus);
    print(categories_healine_data.length);
  }

}