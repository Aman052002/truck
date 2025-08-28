import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/background_image.dart';

import '../../../../constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: BackgroundImage(
          child: Center(
            child: Image.asset(
              height: 185.px,
              width: 180.px,
              ImageConstants.imageAppLogo,
            ),
          ),
        ),
      );
    });
  }
}
