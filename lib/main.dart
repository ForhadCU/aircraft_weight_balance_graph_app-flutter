// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculation_app/N26963/Utils/my_scr_size.dart';
import 'package:calculation_app/N26963/Widget/custom-text.dart';
import 'package:calculation_app/N26963/Widget/custom_button.dart';
import 'package:calculation_app/N698R/Const/const.keywords.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'N26963 Cheetah Weight and Balance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Center(
        child: Container(
          width: MyScreenSize.mGetWidth(context: context, percentage: 68),
          padding: EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  blurRadius: 1,
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Choose Your Plane',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: Colors.black54,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black12,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(id: ConstKeywords.plane_1),
              SizedBox(
                height: 6,
              ),
              CustomText(
                text: "- OR -",
                textColor: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 6,
              ),
              CustomButton(id: ConstKeywords.plane_2)
            ],
          ),
        ),
      ),
    );
  }
}
