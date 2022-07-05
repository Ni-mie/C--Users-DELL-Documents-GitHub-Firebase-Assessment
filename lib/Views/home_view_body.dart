// ignore_for_file: sized_box_for_whitespace

import 'package:firebase_assessment/Controller/user_controller.dart';
import 'package:firebase_assessment/Utilities/app_colors.dart';
import 'package:firebase_assessment/Utilities/big_text.dart';
import 'package:firebase_assessment/Utilities/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: Dimensions.height500,
        width: Dimensions.screenWidth,
        child: ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              return _buildListItem(index);
            })));
  }
}

Widget _buildListItem(int index) {
  final UserController userController = Get.put(UserController());

  return Container(
      height: Dimensions.height100,
      width: Dimensions.screenWidth,
      margin: EdgeInsets.all(Dimensions.height10),
      decoration: const BoxDecoration(color: AppColors.mainappColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: Dimensions.height20,
            child: BigText(
                color: AppColors.mainappColor,
                text: userController.userList[index].name!
                    .substring(0, 1)
                    .capitalize!),
            backgroundColor: AppColors.textheadingwhiteColor,
          ),
          Expanded(
            child: Column(
              children: [
                BigText(
                    color: AppColors.textheadingwhiteColor,
                    text: userController.userList[index].name!),
                BigText(
                    color: AppColors.textheadingwhiteColor,
                    text: userController.userList[index].address!),
                BigText(
                    color: AppColors.textheadingwhiteColor,
                    text: userController.userList[index].phonenumber!),
              ],
            ),
          )
        ],
      ));
}
