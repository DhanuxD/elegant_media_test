import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'bindings/app_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    const MyApp(),
  );

}



class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(

      debugShowCheckedModeBanner: false,


      title: "Elegant Media Hotel App",


      // Global dependency injection
      initialBinding: AppBinding(),


      // First screen
      initialRoute: AppRoutes.LOGIN,


      // All routes
      getPages: AppPages.routes,


      theme: ThemeData(

        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),


        scaffoldBackgroundColor:
        Colors.white,


      ),


    );

  }

}