// ignore_for_file: unnecessary_const

import 'package:firebase_assessment/Controller/user_controller.dart';
import 'package:firebase_assessment/Database/firestore_database.dart';
import 'package:firebase_assessment/Models/user_model.dart';
import 'package:firebase_assessment/Views/home_view.dart';
import 'package:firebase_assessment/Views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //Authcontroller.instance
  static AuthController instance = Get.find();
  //email, password, name, phone number
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  get user => null;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => HomeView());
    }
  }

  void register(String email, password, name, address, phonenumber) async {
    try {
      UserCredential _userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel _user = UserModel(
          docId: _userCredential.user!.uid,
          name: name,
          email: _userCredential.user!.email,
          address: address,
          phonenumber: phonenumber);
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar('About Account Creation', 'Account Creation message',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Account Creation failed',
            style: const TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          await Database().getUser(_userCredential.user!.uid);
    } catch (e) {
      Get.snackbar('About Login', 'Loginmessage',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Login failed',
            style: const TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('About Signout', 'Signout message',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Signout failed',
            style: const TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }
}
