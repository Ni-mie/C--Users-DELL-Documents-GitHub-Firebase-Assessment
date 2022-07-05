// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_assessment/Controller/auth_controller.dart';

import 'package:firebase_assessment/Utilities/app_colors.dart';

import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:firebase_assessment/Utilities/small_text.dart';
import 'package:firebase_assessment/Views/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: Dimensions.height1000,
        padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                AuthController.instance.signOut();
              },
              child: Container(
                height: Dimensions.height50,
                width: Dimensions.screenWidth,
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height15,
                    horizontal: Dimensions.height140),
                decoration: BoxDecoration(
                  color: AppColors.mainappColor,
                  borderRadius: BorderRadius.circular(Dimensions.height15),
                ),
                child: SmallText(
                  text: 'Sign Out',
                  size: Dimensions.height18,
                  color: AppColors.textheadingwhiteColor,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            const HomeViewBody(),
          ],
        ),
      ),
    ));
  }
}
