import 'package:flutter/material.dart';

import '../labels/app_labels.dart';


class AppError extends StatelessWidget {


  final String message;


  const AppError({

    super.key,

    required this.message,

  });


  @override
  Widget build(BuildContext context) {


    return Center(

      child: Padding(

        padding:
        const EdgeInsets.all(20),


        child: AppLabel(

          text: message,

          color: Colors.red,

          textAlign:
          TextAlign.center,

          maxLines: 10,

        ),

      ),

    );

  }

}