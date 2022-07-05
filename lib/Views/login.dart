import 'package:firebase_assessment/Controller/auth_controller.dart';
import 'package:firebase_assessment/Utilities/app_colors.dart';
import 'package:firebase_assessment/Utilities/big_text.dart';
import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:firebase_assessment/Utilities/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.textheadingwhiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Container(
              height: Dimensions.screenHeight,
            ),
            Positioned(
                //For Text
                //
                top: Dimensions.height40,
                left: Dimensions.height100,
                right: Dimensions.height40,
                child: BigText(
                  color: AppColors.mainappColor,
                  text: 'ASSESSMENT',
                  size: Dimensions.height50,
                )),
            Positioned(
              //Container Content
              left: 0,
              right: 0,
              top: Dimensions.height200,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  color: AppColors.textheadingwhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
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
                        obscureText: _isObscure,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height25,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthController.instance.login(
                            emailController.text.trim(),
                            passwordController.text.trim());
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
                          text: 'Sign In',
                          size: Dimensions.height18,
                          color: AppColors.textheadingwhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    SmallText(
                      text: 'or',
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
                    SizedBox(
                      height: Dimensions.height8,
                    ),
                    Row(
                      children: <Widget>[
                        SmallText(
                          text: 'Not a member?',
                          size: 14,
                          color: AppColors.mainappsecondaryColor,
                        ),
                        SizedBox(
                          width: Dimensions.height3,
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(
                                '/signup',
                              );
                            },
                            child: BigText(
                                color: AppColors.mainappColor,
                                text: 'Sign up',
                                size: 16)),
                      ],
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
