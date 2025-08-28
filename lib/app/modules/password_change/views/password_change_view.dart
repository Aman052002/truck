import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/password_change_controller.dart';

class PasswordChangeView extends GetView<PasswordChangeController> {
  const PasswordChangeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  CommonWidgets.backIconBtnView(),
                  SizedBox(height: 30.px),

                  Center(
                    child: Text(
                      StringConstants.createNewPasswordTitle.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 22.px,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.px),

                  // Subtitle
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: StringConstants.createNewPasswordSubTitle.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 12.px,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 36.px),

                  fieldTitleTextView(
                    StringConstants.newPassword.tr,
                    Obx(() => CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.passwordHint.tr,
                      focusNode: controller.passwordFocusNode,
                      controller: controller.passwordController,
                      isCard: controller.isPassword.value,
                      obscureText: controller.isPasswordShow.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isPasswordShow.value =
                        !controller.isPasswordShow.value,
                        child: CommonMethods.appIcons(
                          assetName: controller.isPasswordShow.value
                              ? IconConstantsSvg.icEyeOff
                              : IconConstantsSvg.icEyeOn,
                          color: Theme.of(Get.context!).colorScheme.surface,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    )),
                  ),
                  SizedBox(height: 16.px),

                  fieldTitleTextView(
                    StringConstants.confirmPassword.tr,
                    Obx(() => CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.passwordHint.tr,
                      focusNode: controller.confirmPasswordFocusNode,
                      controller: controller.confirmPasswordController,
                      isCard: controller.isConfirmPassword.value,
                      obscureText: controller.isConfirmPasswordShow.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isConfirmPasswordShow.value =
                        !controller.isConfirmPasswordShow.value,
                        child: CommonMethods.appIcons(
                          assetName: controller.isConfirmPasswordShow.value
                              ? IconConstantsSvg.icEyeOff
                              : IconConstantsSvg.icEyeOn,
                          color: Theme.of(Get.context!).colorScheme.surface,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    )),
                  ),
                  SizedBox(height: 20.px),

                  // Reset Button
                  CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.successDialog();
                    },
                    text: StringConstants.resetPassword.tr,
                  ),
                  SizedBox(height: 16.px),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldTitleTextView(String text, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          text,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
            fontSize: 14.px,
          ),
        ),
        child,
      ],
    );
  }

}
