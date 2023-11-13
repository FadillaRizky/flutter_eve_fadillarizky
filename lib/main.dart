import 'package:flutter/material.dart';
import 'package:flutter_eve_fadillarizky/pages/main_screen.dart';
import 'package:flutter_eve_fadillarizky/pages/profile_page.dart';
import 'package:flutter_eve_fadillarizky/pages/sign_in.dart';
import 'package:flutter_eve_fadillarizky/pages/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  runApp( MyApp(isFirstTime: isFirstTime,));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  MyApp({required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: isFirstTime ? SplashScreen() : MainScreen(),
    );
  }
}
