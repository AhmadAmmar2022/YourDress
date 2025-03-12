import 'package:get/get.dart';


import 'package:yourdress/Screens/language.dart';

import 'package:yourdress/Screens/newdesign/item/Adddress.dart';
import 'package:yourdress/Screens/newdesign/item/details.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/Screens/newdesign/Auth/signup.dart';

import 'package:yourdress/Screens/onboarding.dart';
import 'package:yourdress/Screens/newdesign/splashscreen.dart';
import 'package:yourdress/core/middleware/mymiddleware.dart';

import 'Screens/newdesign/PolicyPage.dart';
import 'Screens/newdesign/item/show.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => OnBoarding(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
    name: AppRoute.loginWidget,
    page: () => loginWidget(),
  ),
  GetPage(
    name: AppRoute.splash,
    page: () => SplashWidget(),
  ),
];
