import 'dart:async';

import 'package:get/get.dart';
import 'package:truck/app/routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () async {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

}
