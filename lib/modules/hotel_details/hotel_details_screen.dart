import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/cards/app_card_view.dart';
import '../../widgets/info_row/app_info_row.dart';
import '../../widgets/labels/app_labels.dart';
import '../../widgets/network_image/app_network_image.dart';

import 'hotel_details_controller.dart';


class HotelDetailsScreen extends StatelessWidget {

  HotelDetailsScreen({super.key});


  final HotelDetailsController controller =
  Get.find<HotelDetailsController>();



  @override
  Widget build(BuildContext context) {

    final hotel = controller.hotel;


    return Scaffold(

      appBar: CustomAppBar(
        title: 'TravelX',
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),


        child: AppCard(

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,


            children: [


              AppNetworkImage(
                imageUrl: hotel.image.medium,
              ),



              Padding(

                padding:
                const EdgeInsets.all(16),


                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,


                  children: [


                    AppLabel(
                      text: hotel.title,
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),



                    const SizedBox(
                      height: 12,
                    ),



                    AppLabel(
                      text: hotel.description,
                      maxLines: 10,
                    ),



                    const Divider(
                      height: 30,
                    ),



                    AppInfoRow(
                      icon: Icons.location_on,
                      value: hotel.address,
                    ),



                    AppInfoRow(
                      icon: Icons.phone,
                      value: hotel.phoneNumber,
                    ),



                    AppInfoRow(
                      icon: Icons.pin_drop,
                      value:
                      "${hotel.latitude}, ${hotel.longitude}",
                    ),


                  ],
                ),
              )

            ],
          ),

        ),
      ),

    );
  }
}