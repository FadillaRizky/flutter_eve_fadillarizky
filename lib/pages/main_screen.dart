import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eve_fadillarizky/pages/sign_in.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class MainScreen extends StatelessWidget {

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: "logo",
                  child: Image.asset("assets/logo.png")),
              Text(
                "Let's you in",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.black38)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  ),
                  onPressed: () {
                    controller.signInGoogle();

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google_logo.png",
                        height: 40,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Google")
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "or",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
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
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Get.to(SigninScreen(
                        title: 'Sign in',
                      ));
                    },
                    child: Text("Sign in with Password")),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(SigninScreen(
                            title: 'Sign up',
                          ));
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
