import 'package:dio/dio.dart';


class DioClient {


  static final Dio dio = Dio(

    BaseOptions(

      connectTimeout:
      const Duration(seconds: 20),


      receiveTimeout:
      const Duration(seconds: 20),


      headers: {

        "Content-Type":
        "application/json",

      },

    ),

  );


}