import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yourdress/core/localization/changelocal.dart';
import 'package:yourdress/core/localization/translation.dart';
import 'package:yourdress/core/services/services.dart';
import 'package:yourdress/routes.dart';


late SharedPreferences sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  sharedpref = await SharedPreferences.getInstance();
  //عبد الرحمن 
  FirebaseDatabase database = FirebaseDatabase.instance;
  database.setPersistenceEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      // routes: routes,
      getPages: routes,
    ); //
  }
}
