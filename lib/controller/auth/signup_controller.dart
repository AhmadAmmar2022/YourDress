import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yourdress/core/constant/routes.dart';
import 'package:yourdress/core/functions/alertexitapp.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late UserCredential credential;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  signUp() async{
     CircularProgressIndicator();
    if (formstate.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
              email: email.text.trim(),
              password: password.text.trim(),
            )
            .then((value) => {postDetailsToFirestore(email.text.trim())});
                   Get.offNamed(AppRoute.login);
        print("==============================>");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          alertAuth();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
         alertAuth();
          print('The account already exists for that email.');
        }
      }
      
       catch (e) {
       Get.defaultDialog(title:"تعذرت العملية ");
      }
    
    } else {
        // Get.offNamed(AppRoute.login);
    }

  }
    postDetailsToFirestore(String email) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('Users');
    ref.doc(user!.uid).set({
      'email': email,
      "username": username.text.trim(),
      "phone":phone.text.trim(),
      
    });
    // Get.to(() =>Login());

  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
