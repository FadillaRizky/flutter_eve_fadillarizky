
import 'package:flutter_eve_fadillarizky/pages/profile_page.dart';
import 'package:flutter_eve_fadillarizky/shared_pref.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/main_screen.dart';

class Controller extends GetxController {
  var _googleSignIn = GoogleSignIn().obs;

  var username = "".obs;
  var photourl = "".obs;

  var isChecked = true.obs;

    signInGoogle()async{
    await _googleSignIn.value.signIn().then((value) async{
       username.value = value!.displayName ?? "";
       photourl.value = value.photoUrl ?? "";
    });
    Get.offAll(ProfilePage());
   }

   signOutGoogle() async {
    try {
      await _googleSignIn.value.signOut();
      Get.offAll(MainScreen());
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}