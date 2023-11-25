import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:news_app/Status/Status.drat.dart';
import 'package:news_app/View_model/top_headlines.dart';
import 'package:news_app/api_base_class/api_base_class.dart';
import 'package:news_app/api_reponse_manage/api_response_manage.dart';

//get headline view_model  instance
Get_news_headlines get_news_headlines = Get.put(Get_news_headlines());

//api_response_manage instance
Api_response_manage api_response_manage = Api_response_manage();

//Request status class instance
Request_status request_status = Get.put(Request_status());