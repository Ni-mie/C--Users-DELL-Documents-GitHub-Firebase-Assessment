import 'package:firebase_assessment/Controller/phone_number_controller.dart';
import 'package:firebase_assessment/Utilities/app_colors.dart';
import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:firebase_assessment/Utilities/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPPAGE extends StatefulWidget {
  const OTPPAGE({Key? key}) : super(key: key);

  @override
  State<OTPPAGE> createState() => _OTPPAGEState();
}

class _OTPPAGEState extends State<OTPPAGE> {
  PhoneNumberController phoneNumberController = Get.find();

  final otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200]?.withOpacity(0.8),
                borderRadius: BorderRadius.circular(Dimensions.height15),
              ),
              child: TextField(
                  controller: otpcontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: Dimensions.height15,
                        horizontal: Dimensions.height10),
                    border: InputBorder.none,
                    hintText: "Enter OTP",
                  )),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            GestureDetector(
              onTap: () {
                phoneNumberController.verifyOTP(otpcontroller.text);
              },
              child: Container(
                height: Dimensions.height50,
                width: Dimensions.screenWidth,
                margin: EdgeInsets.all(Dimensions.height10),
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height15,
                    horizontal: Dimensions.height140),
                decoration: BoxDecoration(
                  color: AppColors.mainappColor,
                  borderRadius: BorderRadius.circular(Dimensions.height15),
                ),
                child: SmallText(
                  text: 'Verify',
                  size: Dimensions.height18,
                  color: AppColors.textheadingwhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
