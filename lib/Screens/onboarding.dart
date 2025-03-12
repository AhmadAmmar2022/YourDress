

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdress/controller/onboarding_controller.dart';
import 'package:yourdress/core/constant/color.dart';
import 'package:yourdress/widget/onboarding/custombutton.dart';
import 'package:yourdress/widget/onboarding/customslider.dart';
import 'package:yourdress/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
