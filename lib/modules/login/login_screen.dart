import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive_helper.dart';
import 'login_controller.dart';


class LoginScreen extends GetView<LoginController> {


  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(

        child: Center(

          child: Container(

            constraints: BoxConstraints(

              maxWidth: ResponsiveHelper.maxContentWidth(context),

            ),


            padding: ResponsiveHelper.screenPadding(context),


            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,


              children: [


                Container(

                  height: 120,

                  width: 120,


                  decoration: BoxDecoration(

                    shape: BoxShape.circle,

                    color: Colors.blue.shade50,

                  ),


                  child: const Icon(

                    Icons.hotel,

                    size: 60,

                    color: Colors.blue,

                  ),

                ),



                const SizedBox(height: 40),



                const Text(

                  "Welcome",

                  style: TextStyle(

                    fontSize: 30,

                    fontWeight: FontWeight.bold,

                  ),

                ),



                const SizedBox(height: 12),



                const Text(

                  "Sign in to explore hotels",

                  textAlign: TextAlign.center,


                  style: TextStyle(

                    fontSize: 16,

                    color: Colors.grey,

                  ),

                ),



                const SizedBox(height: 40),




                Obx(() {


                  return SizedBox(

                    width: double.infinity,

                    height: 52,


                    child: ElevatedButton.icon(


                      onPressed: controller.isLoading.value

                          ? null

                          : controller.loginWithGoogle,



                      icon: controller.isLoading.value

                          ? const SizedBox(

                        height: 20,

                        width: 20,

                        child: CircularProgressIndicator(

                          strokeWidth: 2,

                        ),

                      )

                          : const Icon(

                        Icons.login,

                      ),



                      label: Text(

                        controller.isLoading.value

                            ? "Signing in..."

                            : "Continue with Google",

                      ),


                    ),

                  );


                }),


              ],

            ),

          ),

        ),

      ),

    );

  }
}