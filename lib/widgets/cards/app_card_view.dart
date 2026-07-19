import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme_manager.dart';


class AppCard extends StatelessWidget {

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;


  AppCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
  });


  final AppThemeManager theme =
  Get.find<AppThemeManager>();


  @override
  Widget build(BuildContext context) {


    return Obx(() {


      Widget card = Card(

        elevation: 5,

        color: theme.surface,

        margin: margin ?? EdgeInsets.zero,


        shape: RoundedRectangleBorder(

          borderRadius:
          BorderRadius.circular(15),

        ),


        clipBehavior:
        Clip.antiAlias,


        child: Padding(

          padding:
          padding ?? EdgeInsets.zero,

          child: child,

        ),

      );


      if(onTap != null){

        return InkWell(

          borderRadius:
          BorderRadius.circular(15),

          onTap: onTap,

          child: card,

        );

      }


      return card;


    });


  }

}