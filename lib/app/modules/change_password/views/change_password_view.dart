import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 6.px),
                CommonWidgets.appBarView(title: StringConstants.changePassword.tr),
                Divider(
                  thickness: 1.px,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                  indent: 5.px,
                  endIndent: 5.px,
                  height: 20.px,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 30.px),
                      Obx(
                          () => CommonWidgets.commonTextFieldForLoginSignUP(
                        hintText: StringConstants.newPassword.tr,
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
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                      SizedBox(height: 16.px),
                      Obx(
                            () => CommonWidgets.commonTextFieldForLoginSignUP(
                          hintText: StringConstants.confirmNewPassword.tr,
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
                        ),
                      ),
                      SizedBox(height: 200.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () {},
                        text: StringConstants.save.tr,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
