// ignore_for_file: unnecessary_this

import 'package:firebase_assessment/Views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  var authState = ''.obs;
  String verificationID = '';
  var auth = FirebaseAuth.instance;

  void verifyPhone(String phonenumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (AuthCredential authcredential) {},
        verificationFailed: (authException) {
          Get.snackbar('error', 'problem sending code');
        },
        codeSent: (String id, [int? forceResent]) {
          this.verificationID = id;
          authState.value = 'login Success';
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationID = id;
        });
  }

  verifyOTP(String otp) async {
    UserCredential _userCredential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationID, smsCode: otp));

    if (_userCredential.user!.phoneNumber != null) {
      Get.to(HomeView());
    }
  }
}
