import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/hotel_models.dart';
import '../../data/services/hotel_service.dart';




class HotelsController extends GetxController {


  final HotelService _hotelService =
  HotelService();



  RxList<HotelModel> hotels =
      <HotelModel>[].obs;



  RxBool isLoading =
      false.obs;



  RxString errorMessage =
      "".obs;




  @override
  void onInit() {

    super.onInit();

    fetchHotels();

  }




  Future<void> fetchHotels() async {


    try {


      isLoading.value = true;

      errorMessage.value = "";



      final result =
      await _hotelService.fetchHotels();



      print(
          "Hotel Count : ${result.length}"
      );



      hotels.assignAll(result);



    }
    catch(e){

   log(e.toString());
      errorMessage.value =
          e.toString();


    }
    finally{


      isLoading.value = false;


    }


  }


}