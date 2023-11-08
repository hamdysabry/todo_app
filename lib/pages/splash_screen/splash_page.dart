import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/home_layout/home_layout.dart';

class splashpage extends StatefulWidget {
  const splashpage({Key? key}) : super(key: key);
  static const String routeName = "splash_page ";

  @override
  State<splashpage> createState() => _splashpageState();
}

class _splashpageState extends State<splashpage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"), fit: BoxFit.fill)),
    );
  }
}
