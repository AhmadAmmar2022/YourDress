
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/splashscreen.dart';
import 'package:yourdress/core/constant/routes.dart';
import 'package:yourdress/core/services/services.dart';
import 'package:yourdress/data/datasource/static/static.dart';



abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {

  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find() ; 

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
       myServices.sharedPreferences.setString("onboarding", "1") ; 
      //  Get.offAllNamed(AppRoute.loginWidget) ; 
      Get.to(()=>SplashWidget());
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
