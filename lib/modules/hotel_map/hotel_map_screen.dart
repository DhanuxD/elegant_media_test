import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/app_bar/app_bar.dart';
import 'hotel_map_controller.dart';



class HotelMapScreen extends StatelessWidget {


  HotelMapScreen({super.key});


  final HotelMapController controller =
  Get.find<HotelMapController>();



  @override
  Widget build(BuildContext context) {


    return SafeArea(
      top: false,
      child: Scaffold(

        appBar: CustomAppBar(
          title: "Hotel Location",
        ),


        body: GoogleMap(

          initialCameraPosition: CameraPosition(

            target: LatLng(

              controller.latitude,

              controller.longitude,

            ),

            zoom: 15,

          ),



          markers: {


            Marker(

              markerId:
              const MarkerId("hotel"),


              position: LatLng(

                controller.latitude,

                controller.longitude,

              ),



              infoWindow: InfoWindow(

                title: controller.hotelName,

                snippet:
                "Hotel Location",

              ),

            ),


          },


        ),


      ),
    );

  }


}