import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text(String data, Color text_color, FontWeight fnt_wei, double size) {
  return Text(
    data,
    style: TextStyle(color: text_color, fontWeight: fnt_wei, fontSize: size),
  );
}

Widget textfield(String text,Icon icon) {
  return TextField(
    cursorColor: Colors.white,
    decoration: InputDecoration(
      fillColor: Colors.white,
      focusColor: Colors.white,
      hintText: text,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      suffixIcon: icon
    ),
  );
}


Widget button(double h, double w)
{
  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.circular(30)
    ),
    child: Center(
      child: Text('Login',style: TextStyle(fontSize:23,fontWeight: FontWeight.w700),),
    ),
  );
}
