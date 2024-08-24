import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/screens/introduction_screens/auth_screens/sign_in_screen.dart';
import 'package:petcare_app_management/screens/introduction_screens/auth_screens/sign_up_screen.dart';
import 'package:petcare_app_management/screens/feature_screens/splash_screen.dart';

class GetPageRoutes {
  static const ROUTE_SPLASH = '/splash';
  static const ROUTE_SIGN_IN = '/signIn';
  static const ROUTE_SIGN_UP = '/signUp';
  static const ROUTE_MAIN_SCREEN = '/petCareAppScreen';
  static List<GetPage> getPages = [
    // GetPage(name: ROUTE_SPLASH, page: () => SplashScreen(snapshot: Get.arguments,)),
    GetPage(name: ROUTE_SIGN_IN, page: () => SignIn()),
    GetPage(name: ROUTE_SIGN_UP, page: () => SignUpScreen()),
    GetPage(name: ROUTE_MAIN_SCREEN, page: () => PetCareAppScreen()),
  ];
}