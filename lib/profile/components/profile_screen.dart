import 'package:flutter/material.dart';
import 'package:hephaestapp/profile/body.dart';
// ignore: unused_import
import 'package:hephaestapp/profile/components/enums.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Body(),
    );
  } 
}

