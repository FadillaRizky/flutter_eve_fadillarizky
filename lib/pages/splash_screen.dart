import 'package:flutter/material.dart';
import 'package:flutter_eve_fadillarizky/pages/main_screen.dart';
import 'package:flutter_eve_fadillarizky/pages/profile_page.dart';
import 'package:flutter_eve_fadillarizky/shared_pref.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isFirst') ?? false;
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => isLoggedIn ? ProfilePage() : MainScreen(),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _checkIsFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
          () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isFirstTime', false);
        Get.offAll(
          transition:  Transition.fade,
            duration: Duration(seconds: 3),
            MainScreen());
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: "logo",
            child: Image.asset("assets/logo.png")),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
