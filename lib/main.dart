import 'package:flutter/material.dart';
import 'package:hephaestapp/loginRegPage.dart';

void main ()
{
  runApp(new Hephaestapp());
}


class Hephaestapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hephaestapp" ,
      theme: new ThemeData(
        fontFamily: 'Helvetica',
      ),

      home: LoginRegPage(),
    );
  }
}