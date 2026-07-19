import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../labels/app_labels.dart';
import '../network_image/app_network_image.dart';

import '../../modules/hotel_map/hotel_map_controller.dart';


class HotelInfoCard extends StatelessWidget {

  HotelInfoCard({super.key});


  final controller = Get.find<HotelMapController>();


  @override
  Widget build(BuildContext context) {


    return Container(

      padding: const EdgeInsets.all(14),


      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20),


        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(0.15),

            blurRadius: 15,

            offset:
            const Offset(0,5),

          ),

        ],

      ),



      child: Row(

        children: [


          ClipRRect(

            borderRadius:
            BorderRadius.circular(15),


            child: SizedBox(

              height: 90,

              width: 90,


              child: AppNetworkImage(

                imageUrl:
                controller.hotelImage,

              ),

            ),

          ),



          const SizedBox(width: 14),



          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              mainAxisAlignment:
              MainAxisAlignment.center,


              children: [



                AppLabel(

                  text:
                  controller.hotelName,


                  fontSize: 18,

                  fontWeight:
                  FontWeight.bold,

                  maxLines: 2,

                ),



                const SizedBox(height: 5),



                Row(

                  children: const [

                    Icon(

                      Icons.star,

                      size: 18,

                      color: Colors.orange,

                    ),


                    SizedBox(width: 4),


                    Text(
                      "4.8",
                      style: TextStyle(
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),

                  ],

                ),



                const SizedBox(height: 5),



                AppLabel(

                  text:
                  controller.address,


                  maxLines: 2,

                  fontSize: 13,

                ),



                const SizedBox(height: 10),



                SizedBox(

                  height: 38,


                  width: double.infinity,


                  child: ElevatedButton.icon(

                    onPressed: () {


                      Get.snackbar(

                        "Navigation",

                        "Opening directions...",


                        snackPosition:
                        SnackPosition.BOTTOM,

                      );


                    },


                    icon: const Icon(

                      Icons.directions,

                      size: 18,

                    ),


                    label:
                    const Text(
                      "Directions",
                    ),


                  ),

                )

              ],


            ),

          )

        ],


      ),

    );


  }


}