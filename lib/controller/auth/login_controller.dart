
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yourdress/core/constant/routes.dart';
import 'package:yourdress/core/services/services.dart';

import '../../core/functions/alertexitapp.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late UserCredential credential;
  bool isshowpassword = true;

  MyServices myServices = Get.find() ; 
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async{
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
       try {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
                   myServices.sharedPreferences.setString("login", "1") ;
                  Get.offNamed(AppRoute.myhome);
       
       } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          alertAuth();
       
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
              alertAuth();
        }
      
       }
         catch (e) {
            alertAuth();
      }
    

         
    }  
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() async{
     
                        credential =
                            await FirebaseAuth.instance.signInAnonymously();
                        print(credential.user!.isAnonymous);
                         if (credential.user!.isAnonymous) {
                           Get.offNamed(AppRoute.LoginScreen);
                         }
                        
                      }
                    
  }

