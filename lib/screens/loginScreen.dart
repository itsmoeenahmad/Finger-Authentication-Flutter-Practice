import 'package:flutter/material.dart';
import 'package:flutter_finger_authentication/reusableWidgets/reusable_widgets.dart';
import 'package:flutter_finger_authentication/screens/homeScreen.dart';
import 'package:flutter_finger_authentication/sharedPreferences/finger_data.dart';
import 'package:local_auth/local_auth.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //Finger Authentication Code - Method

  finger_auth() async {
    final LocalAuthentication _auth = LocalAuthentication();

    bool check = await _auth.canCheckBiometrics;
    print("Check = ${check}");
    if (check) {
      print('Device Supported Finger Authentication');
      bool _authenticating = await _auth.authenticate(
        localizedReason: "Scan your Finger Now",
        options: AuthenticationOptions(biometricOnly: true,stickyAuth: false),
      );
      if(_authenticating)
        {
          print(_authenticating);
         await SharedPreferencesClass.set_finger(_authenticating);
          print('Authentication Done');
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>homeScreen())
          );
          bool? check1 = await SharedPreferencesClass.get_finger();
          print("Authentication after getting from memory is = ${check1}");
        }
      else{
        print('Authentication Failed');
      }

    } else {
      print('Device Is Not Supporting Finger Authentication');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withBlue(16),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            text("Welcome Back!", Colors.white, FontWeight.bold, 25.0),
            SizedBox(
              height: height * 0.005,
            ),
            text("Login to continue", Colors.white, FontWeight.w700, 15.0),
            SizedBox(
              height: height * 0.07,
            ),
            textfield('Enter Your Email Address', Icon(Icons.email)),
            SizedBox(
              height: height * 0.02,
            ),
            textfield('Enter Your Password', Icon(Icons.visibility_off)),
            SizedBox(
              height: height * 0.04,
            ),
            button(
              height * 0.07,
              width * 0.65,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            text('Or', Colors.white, FontWeight.w500, 16),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                print("Tapped on finger");
                finger_auth();
              },
              child: Container(
                height: height * 0.07,
                width: width * 0.13,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Center(
                  child: Icon(
                    Icons.fingerprint,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
