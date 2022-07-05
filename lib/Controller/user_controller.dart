// ignore_for_file: unused_field, avoid_print

import 'package:firebase_assessment/Database/firestore_database.dart';
import 'package:firebase_assessment/Models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = UserModel().obs;
  var isLoading = false;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    userList.bindStream(Database().getUsers());
    super.onInit();
  }

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
