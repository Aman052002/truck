import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {


  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final isPassword = false.obs;
  final isPasswordShow = true.obs;

  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  final isConfirmPassword = false.obs;
  final isConfirmPasswordShow = true.obs;

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
