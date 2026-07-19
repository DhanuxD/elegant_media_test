import 'package:get/get.dart';

class HotelMapController extends GetxController {

  late dynamic hotel;


  @override
  void onInit() {

    super.onInit();

    hotel = Get.arguments;

  }


  double get latitude {

    return double.parse(
      hotel.latitude.toString(),
    );

  }


  double get longitude {

    return double.parse(
      hotel.longitude.toString(),
    );

  }


  String get hotelName {

    return hotel.title;

  }


}