import 'package:flutter/material.dart';

import '../labels/app_labels.dart';


class AppInfoRow extends StatelessWidget {


  final IconData icon;

  final String value;

  final Color? iconColor;


  const AppInfoRow({

    super.key,

    required this.icon,

    required this.value,

    this.iconColor,

  });


  @override
  Widget build(BuildContext context) {


    return Padding(

      padding:
      const EdgeInsets.only(bottom: 12),


      child: Row(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Icon(

            icon,

            size: 18,

            color:

            iconColor ??

                Theme.of(context)
                    .colorScheme
                    .primary,

          ),


          const SizedBox(width: 10),


          Expanded(

            child: AppLabel(

              text: value,

              maxLines: 10,

            ),

          ),

        ],

      ),

    );

  }

}