import 'package:flutter/material.dart';


class AppNetworkImage extends StatelessWidget {


  final String imageUrl;

  final double height;

  final BoxFit fit;


  const AppNetworkImage({

    super.key,

    required this.imageUrl,

    this.height = 220,

    this.fit = BoxFit.cover,

  });


  @override
  Widget build(BuildContext context) {


    return SizedBox(

      height: height,

      width: double.infinity,


      child: Image.network(

        imageUrl,

        fit: fit,


        loadingBuilder:
            (context, child, loadingProgress){


          if(loadingProgress == null){

            return child;

          }


          return const Center(

            child:
            CircularProgressIndicator(),

          );


        },


        errorBuilder:
            (context,error,stackTrace){


          return Container(

            color:
            Colors.grey.shade300,


            child: const Center(

              child: Icon(

                Icons.image_not_supported,

                size: 60,

              ),

            ),

          );


        },

      ),

    );


  }

}