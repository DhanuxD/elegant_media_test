import 'package:get/get.dart';
import '../../data/services/auth_service.dart';



class LoginController extends GetxController {


  final AuthService authService = Get.find<AuthService>();


  final isLoading = false.obs;



  Future<void> loginWithGoogle() async {

    try {

      isLoading.value = true;


      final user = await authService.signInWithGoogle();


      if(user != null){

        Get.offNamed('/hotels');

      }


    }catch(e){
     print(e.toString());
      Get.snackbar(
        "Login Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );


    }finally{

      isLoading.value = false;

    }

  }

}