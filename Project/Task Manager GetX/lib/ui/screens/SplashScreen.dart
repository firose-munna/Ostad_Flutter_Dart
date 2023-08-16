import 'package:flutter/material.dart';
import 'package:taskmanager/data/model/authUtilty.dart';
import 'package:taskmanager/ui/screens/auth/login_screen.dart';
import 'package:taskmanager/ui/screens/bottomNavBaseScreen.dart';
import 'package:taskmanager/ui/utils/assets_utils.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
      if (mounted) {
        Get.offAll(()=> isLoggedIn ? const BottomNavBaseScreen() : const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Image.asset(
            AssetsUtils.logoPNG,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
