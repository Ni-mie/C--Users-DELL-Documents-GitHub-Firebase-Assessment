// ignore_for_file: prefer_const_constructors

import 'package:firebase_assessment/Bindings/user_binding.dart';
import 'package:firebase_assessment/Controller/auth_controller.dart';
import 'package:firebase_assessment/Views/home_view.dart';
import 'package:firebase_assessment/Views/login.dart';
import 'package:firebase_assessment/Views/otp_view.dart';
import 'package:firebase_assessment/Views/signup.dart';
import 'package:firebase_assessment/Views/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/otp', page: () => OTPPAGE()),
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: UserBinding(),
        ),
      ],
    );
  }
}
