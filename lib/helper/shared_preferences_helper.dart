import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final UserController userController = Get.find();
  ///SAVE USER ACCOUNT
  saveUserAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userController.emailController.text);
    await prefs.setString('password', userController.passwordController.text);
  }

  ///GET USER ACCOUNT
  getUserAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userController.emailController.text.isEmpty && userController.passwordController.text.isEmpty){
      userController.emailController.text = prefs.getString('email')!;
      userController.passwordController.text = prefs.getString('password')!;
    }
  }

  ///DELETE USER ACCOUNT
  deleteUserAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }

  ///GET USER FIRST TIME
  Future<bool> getUserFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;
    if (isFirstTime){
      await prefs.setBool('isFirstTimeUser', false);
    }
    print("Is First Time: ${isFirstTime}");
    return isFirstTime;
  }
}