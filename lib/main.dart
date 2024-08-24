import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/main_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/auth_helper.dart';
import 'package:petcare_app_management/helper/initial_binding.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/screens/introduction_screens/introduction_screen.dart';
import 'package:petcare_app_management/screens/feature_screens/splash_screen.dart';
import 'package:petcare_app_management/share/Classes/get_page_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(const PetCare());
  } catch (e) {
    print('Firebase initialization error: $e');
  }
}

class PetCare extends StatefulWidget {
  const PetCare({super.key});

  @override
  State<PetCare> createState() => _PetCareState();
}

class _PetCareState extends State<PetCare> {
  final AppController appController = Get.put<AppController>(AppController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      theme: ThemeData(
        fontFamily: 'Satoshi',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Satoshi'),
      ),
      getPages: GetPageRoutes.getPages,
      // initialRoute: GetPageRoutes.ROUTE_SPLASH,
      home:
      StreamBuilder(stream: AuthHelper().authStateChanges, builder: (context, snapshot){
        return SplashScreen(snapshot: snapshot,);
      }),
    );
  }
}
