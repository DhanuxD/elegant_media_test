import 'package:get/get.dart';

import '../../data/models/hotel_models.dart';



class HotelDetailsController extends GetxController {

  late HotelModel hotel;


  @override
  void onInit() {
    super.onInit();

    final argument = Get.arguments;

    if (argument is HotelModel) {
      hotel = argument;
    } else {
      Get.back();
      Get.snackbar(
        "Error",
        "Hotel details not found",
      );
    }
  }

}