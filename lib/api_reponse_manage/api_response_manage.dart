import 'dart:io';
import 'package:news_app/api_base_class/api_base_class.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/excaption/excaption.dart';


class Api_response_manage extends Api_base_class
{
    //method return dynamic reponnse
    dynamic response_return(http.Response response)
    {
       switch(response.statusCode)
       {
         case 200 :
           return response.body;
           break;

         case 401 :
           throw InvalidurlExcaption(error_msg: "Invalid url");
           break;
       }
    }


    //global variable  for api_reponse
    dynamic api_response;

    //over ride get method
  @override
  Future get_api(String url) async {
    try
    {
        var Reponse =  await http.get(Uri.parse(url));
        api_response = response_return(Reponse);
        return api_response;
    }on SocketException
    {
       throw InternetExcaption(error_msg: "No Internet");
    }
  }


}