import 'package:firebase_assessment/Utilities/app_colors.dart';
import 'package:firebase_assessment/Utilities/big_text.dart';
import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        padding: EdgeInsets.only(
            top: Dimensions.height15,
            left: Dimensions.height15,
            right: Dimensions.height15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              color: AppColors.mainappColor,
              text: 'Chalbo India Private Limited',
              size: Dimensions.height50,
            ),
            BigText(
                color: AppColors.mainappColor,
                text: 'Assessment',
                size: Dimensions.height50),
            SizedBox(
              height: Dimensions.height20,
            ),
          ],
        ),
      ),
    );
  }
}
