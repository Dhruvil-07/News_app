class App_excaption implements Exception
{
    String msg;

    App_excaption({required this.msg});

    String tostring()
    {
      return msg;
    }
}



//internet excaption
class InternetExcaption extends App_excaption
{
   String error_msg;

   InternetExcaption({required this.error_msg}) : super(msg: error_msg);
}



//invalid  url
class InvalidurlExcaption extends App_excaption
{
  String error_msg;

  InvalidurlExcaption({required this.error_msg}) : super(msg: error_msg);
}