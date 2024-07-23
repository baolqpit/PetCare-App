import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/helper/auth_helper.dart';
import 'package:petcare_app_management/helper/initial_binding.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/screens/introduction_screens/introduction_screen.dart';
import 'package:petcare_app_management/screens/introduction_screens/splash_screen.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Raleway'),
      ),
      home: StreamBuilder(stream: AuthHelper().authStateChanges, builder: (context, snapshot){
        if (snapshot.hasData){
          return _buildAppBody();
        } else {
          return IntroductionScreen();
        }
      }),
    );
  }

  _buildAppBody() {
    return SplashScreen();
  }
}
