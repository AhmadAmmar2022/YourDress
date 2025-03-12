import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import 'package:yourdress/Screens/newdesign/item/show.dart';
import 'package:yourdress/core/constant/routes.dart';
import 'package:yourdress/core/functions/alertexitapp.dart';

abstract class additemcontroller extends GetxController {
  pickImageFromcamire();
  pickImageFromGallery();
  add();
}

class additemcontrollerImp extends additemcontroller {
  late Rx<File?> selectedImage = Rx(null);

 
  File? myfile;
  var imagename;
  late  String url;
  final imagePicker = ImagePicker();
  late File imageFile;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

late UserCredential credential;
  late TextEditingController des;
  late TextEditingController size;
  late TextEditingController price;
  late TextEditingController typeofsale;
  late TextEditingController dur;

   @override
    pickImageFromcamire() async {
    try {
      XFile? xfile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (xfile != null) {
        selectedImage.value = File(xfile.path);
         imagename=basename(xfile.path);
      }
    } on PlatformException catch (e) {
      print("================================");
      print(e);
    }
  }
 

  
  @override
  pickImageFromGallery() async {
    try {
      XFile? xfile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xfile != null) {
        selectedImage.value = File(xfile.path);
        imagename=basename(xfile.path);
        print("================>");
        print(imagename);
      }
    } on PlatformException catch (e) {
      print("================================");
      print(e);
    }
  }
  
   Future uploadImage() async {
    if (selectedImage.value == null) {
    // Handle the case where selectedImage.value is null
    return null;
  }
    var rendom = Random().nextInt(1000);
    imagename = "$rendom$imagename";
    var imageref = FirebaseStorage.instance.ref("images/$imagename");

    try {
      await imageref.putFile(selectedImage.value!);
      url = await imageref.getDownloadURL();
      print(url.toString());
    } on FirebaseException catch (e) {
      print(e);
    }
    return url; 
  }

   @override
   add() async {
   CollectionReference Dress = FirebaseFirestore.instance.collection('Dress');
 print("============================>");
 print(FirebaseAuth.instance.currentUser?.uid.toString());
    // {
       url = await uploadImage();
     await  Dress.add({
        "des":des.text.trim(),
        "size": size.text.trim(),
        "price": price.text.trim(),
        "type":typeofsale.text.trim(),
        "dur": dur.text.trim(),
        "user_id": FirebaseAuth.instance.currentUser?.uid.toString(),
        "url":url.toString()
      }).then((value) {
        Get.to(() => MyHomePage()); 
      }).catchError((e) {
        print("this is error $e");
      });
    // }
  }
  @override
  void onInit() {
    des = TextEditingController();
    size = TextEditingController();
    price = TextEditingController();
    typeofsale = TextEditingController();
     dur = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    des.dispose();
    size.dispose();
    price.dispose();
    typeofsale.dispose();
    dur.dispose();
    super.dispose();// 
  }
}
