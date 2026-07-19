import 'package:flutter/material.dart';
import '../labels/app_labels.dart';

class AppEmpty extends StatelessWidget {


  final String message;


  const AppEmpty({

    super.key,

    required this.message,

  });


  @override
  Widget build(BuildContext context) {


    return Center(

      child: AppLabel(

        text: message,

        textAlign: TextAlign.center,

      ),

    );

  }

}