// ignore_for_file: unused_local_variable

import 'package:firebase_assessment/Controller/auth_controller.dart';
import 'package:firebase_assessment/Controller/phone_number_controller.dart';
import 'package:firebase_assessment/Utilities/app_colors.dart';
import 'package:firebase_assessment/Utilities/big_text.dart';
import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:firebase_assessment/Utilities/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  final PhoneNumberController phonenumberController =
      Get.put(PhoneNumberController());
  PhoneNumberController phoneNumberController = Get.find();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var addressController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.textheadingwhiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Container(
              height: Dimensions.height1000,
            ),
            Positioned(
                top: Dimensions.height40,
                left: Dimensions.height10,
                right: Dimensions.height350,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.mainappsecondaryColor,
                  ),
                )),
            Positioned(
              //For Text
              //
              top: Dimensions.height80,
              left: Dimensions.height20,
              right: Dimensions.height20,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BigText(
                        color: AppColors.mainappsecondaryColor,
                        text: 'Create your',
                        size: 40),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    BigText(
                      color: AppColors.mainappsecondaryColor,
                      text: 'Account',
                      size: Dimensions.height40,
                    )
                  ]),
            ),
            Positioned(
              //Container Content
              left: 0,
              right: 0,
              top: Dimensions.height180,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    Dimensions.height20,
                    Dimensions.height10,
                    Dimensions.height20,
                    Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColors.textheadingwhiteColor,
                  borderRadius: BorderRadius.circular(Dimensions.height15),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15,
                                horizontal: Dimensions.height10),
                            border: InputBorder.none,
                            hintText: "Full Name",
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15,
                                horizontal: Dimensions.height10),
                            border: InputBorder.none,
                            hintText: "Email",
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15,
                                horizontal: Dimensions.height10),
                            border: InputBorder.none,
                            hintText: "Password",
                            suffixIconColor: AppColors.mainappColor,
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15,
                                horizontal: Dimensions.height10),
                            border: InputBorder.none,
                            hintText: "Address",
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Dimensions.height15,
                                horizontal: Dimensions.height10),
                            border: InputBorder.none,
                            hintText: "Phone Number",
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthController.instance.register(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                            addressController.text.trim(),
                            phoneController.text.trim());
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SmallText(
                          text: 'Sign Up',
                          size: Dimensions.height18,
                          color: AppColors.textheadingwhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        phoneNumberController.verifyPhone(phoneController.text);
                        Get.toNamed(
                          '/otp',
                        );
                      },
                      child: Container(
                        height: Dimensions.height50,
                        width: Dimensions.screenWidth,
                        margin: EdgeInsets.all(Dimensions.height10),
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height15,
                            horizontal: Dimensions.height80),
                        decoration: BoxDecoration(
                          color: AppColors.mainappColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SmallText(
                          text: 'Verify Phone Number',
                          size: Dimensions.height18,
                          color: AppColors.textheadingwhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    SmallText(
                      text: 'or continue with',
                      size: Dimensions.height18,
                      color: AppColors.mainappsecondaryColor,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: 'Continue With Google',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: Dimensions.height3,
                    ),
                    SignInButton(
                      Buttons.Apple,
                      text: 'Continue With Apple',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
