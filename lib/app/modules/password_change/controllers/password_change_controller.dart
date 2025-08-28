import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../../../routes/app_pages.dart';

class PasswordChangeController extends GetxController {

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

  successDialog() {
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,

      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 26.px),
              CommonMethods.appIcons(
                height: 100.px,
                width: 100.px,
                assetName: IconConstantsSvg.icSuccessMark,
              ),
              SizedBox(height: 30.px),
              Text(
                StringConstants.passwordChangedSuccessfully.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 22.px,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.px),
                child: CommonWidgets.commonElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.LOGIN),
                  text: StringConstants.backToLogin.tr,
                ),
              ),
              SizedBox(height: 26.px),
            ],
          ),
        );
      },
    );
  }

}
