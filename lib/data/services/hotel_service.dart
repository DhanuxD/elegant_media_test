import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/hotel_models.dart';
import 'dio_client.dart';


class HotelService {


  final Dio _dio = DioClient.dio;



  Future<List<HotelModel>> fetchHotels() async {


    final response = await _dio.get(
      "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json",
    );



    dynamic responseData = response.data;



    // Convert String JSON to Map
    if(responseData is String){

      responseData = jsonDecode(responseData);

    }



    List<dynamic> data =
    responseData["data"];



    return data
        .map(
          (item)=>HotelModel.fromJson(item),
    )
        .toList();


  }

}