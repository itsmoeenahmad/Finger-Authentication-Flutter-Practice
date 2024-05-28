import 'package:flutter/material.dart';
import 'package:flutter_finger_authentication/reusableWidgets/reusable_widgets.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withBlue(16),
      appBar: AppBar(
        backgroundColor: Colors.black.withBlue(16),
        automaticallyImplyLeading: false,
        title: Text("Home Screen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.13, right: width * 0.13,top: height*0.35),
        child: Column(
          children: [
            text("Welcome To Home Screen!!!", Colors.white, FontWeight.w600, 20)
          ],
        ),
      ),
    );
  }
}
