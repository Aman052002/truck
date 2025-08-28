import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final isPassword = false.obs;
  final isPasswordShow = true.obs;

  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  final isConfirmPassword = false.obs;
  final isConfirmPasswordShow = true.obs;

  final tAndCValue = false.obs;

  RxnString signUpTypeValue = RxnString('User');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
