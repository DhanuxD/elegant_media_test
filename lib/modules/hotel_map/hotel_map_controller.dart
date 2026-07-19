import 'package:get/get.dart';

class HotelMapController extends GetxController {

  late double latitude;
  late double longitude;

  late String hotelName;
  late String hotelImage;
  late String address;


  void setHotelData({

    required double latitude,
    required double longitude,
    required String hotelName,
    required String hotelImage,
    required String address,

  }) {

    this.latitude = latitude;
    this.longitude = longitude;

    this.hotelName = hotelName;
    this.hotelImage = hotelImage;
    this.address = address;

  }


}