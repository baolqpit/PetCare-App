import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/app.dart';
void main() {
  runApp(const PetCare());
}

class PetCare extends StatefulWidget {
  const PetCare({super.key});

  @override
  State<PetCare> createState() => _PetCareState();
}

class _PetCareState extends State<PetCare> {
  @override
  void initState() {
    // TODO: implement initState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: StoreBinding(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Raleway'),
      ),
      home: _buildAppBody()
    );
  }

  _buildAppBody(){
    return PetCareAppScreen();
  }
}

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => UserController());
    // TODO: implement dependencies
  }

}
