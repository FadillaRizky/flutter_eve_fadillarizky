import 'package:flutter/material.dart';
import 'package:flutter_eve_fadillarizky/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class SigninScreen extends StatefulWidget {
  final String title;

  const SigninScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset("assets/logo.png", width: 300),
            (widget.title == "Sign up")
                ? Text(
                    "Sign up for free",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "      Email",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black12),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black12, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.black12,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "      Password",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black12),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black12, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.black12,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                      value: controller.isChecked.value,
                      onChanged: (value) {
                        controller.isChecked.value = value!;
                      });
                }),
                SizedBox(width: 5,),
                Text("Remember Me",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xC22DB774)),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Get.to(ProfilePage());
                  },
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text("or continue with",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              IconButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black12))
                  ),
                  onPressed: (){}, icon: Image.asset("assets/google_logo.png",width: 40,)),
              IconButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black12))
                  ),
                  onPressed: (){}, icon: Image.asset("assets/facebook_logo.png",width: 40,)),
              IconButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black12))
                  ),
                  onPressed: (){}, icon: Image.asset("assets/apple_logo.png",width: 40,))
            ],)
          ],
        ),
      ),
    );
  }
}
