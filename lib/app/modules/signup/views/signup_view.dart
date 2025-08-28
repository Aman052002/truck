import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 16.px),
              Text(
                StringConstants.hello.tr,//'Hello 👋',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 26.px,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${StringConstants.getStartedWith.tr} ',//'Get started with',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 18.px,
                    ),
                  ),
                  Text(
                    StringConstants.trucking.tr,//'Trucking',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18.px,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.px),
              fieldTitleTextView(
               StringConstants.selectAccountType.tr,// 'Select Account Type',
                Obx(
                  () => Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.signUpTypeValue.value = 'User',
                          child: Container(
                            height: 44.px,
                            decoration: BoxDecoration(
                              gradient:
                                  controller.signUpTypeValue.value == 'User'
                                  ? CommonMethods.commonLinearGradientView()
                                  : null,
                              borderRadius: BorderRadius.circular(10.px),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(.1, .1),
                                  color: Theme.of(
                                    Get.context!,
                                  ).colorScheme.surface.withAlpha(50),
                                ),
                              ],
                              color: Theme.of(
                                Get.context!,
                              ).scaffoldBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                StringConstants.user.tr, //'User',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          controller.signUpTypeValue.value ==
                                              'User'
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onPrimary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onPrimaryContainer,
                                      fontSize: 14.px,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              controller.signUpTypeValue.value = 'Driver',
                          child: Container(
                            height: 44.px,
                            decoration: BoxDecoration(
                              gradient:
                                  controller.signUpTypeValue.value == 'Driver'
                                  ? CommonMethods.commonLinearGradientView()
                                  : null,
                              borderRadius: BorderRadius.circular(10.px),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(.1, .1),
                                  color: Theme.of(
                                    Get.context!,
                                  ).colorScheme.surface.withAlpha(50),
                                ),
                              ],
                              color: Theme.of(
                                Get.context!,
                              ).scaffoldBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                StringConstants.driver.tr,//'Driver',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          controller.signUpTypeValue.value ==
                                              'Driver'
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onPrimary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onPrimaryContainer,
                                      fontSize: 14.px,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.name.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  keyboardType: TextInputType.name,
                  hintText: StringConstants.hintName.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.emailAddress.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  keyboardType: TextInputType.emailAddress,
                  hintText: StringConstants.hintEmail.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.phoneNumber.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  keyboardType: TextInputType.number,
                  hintText: StringConstants.hintPhone.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.addressLine1.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  keyboardType: TextInputType.streetAddress,
                  hintText: StringConstants.hintAddress1.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.addressLine2.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  keyboardType: TextInputType.streetAddress,
                  hintText: StringConstants.hintAddress2.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.city.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: StringConstants.hintCity.tr,
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.location.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: StringConstants.hintLocation.tr,
                  suffixIcon: CommonMethods.appIcons(
                    assetName: IconConstantsSvg.icLocation,
                    color: Theme.of(Get.context!).colorScheme.surface,
                  ),
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.password.tr,
                Obx(
                      () => CommonWidgets.commonTextFieldForLoginSignUP(
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
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(height: 16.px),
              fieldTitleTextView(
                StringConstants.confirmPassword.tr,
                Obx(
                      () => CommonWidgets.commonTextFieldForLoginSignUP(
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
                  ),
                ),
              ),

              SizedBox(height: 30.px),
              Row(
                spacing: 10,
                children: [
                  Obx(
                        () => GestureDetector(
                      onTap: () => controller.tAndCValue.value =
                      !controller.tAndCValue.value,
                      child: Container(
                        height: 26.px,
                        width: 26.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              offset: Offset(.1, .1),
                              color: Theme.of(
                                Get.context!,
                              ).colorScheme.surface.withAlpha(50),
                            ),
                          ],
                          color: Theme.of(Get.context!).scaffoldBackgroundColor,
                        ),
                        child: controller.tAndCValue.value
                            ? Center(
                          child: CommonMethods.appIcons(
                            assetName: IconConstantsSvg.icCheck,
                            height: 16,
                          ),
                        )
                            : null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.signInAgreement.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 12.px,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              StringConstants.termsAndConditions.tr,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 12.px,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                            Text(
                              ' , ',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 12.px,
                              ),
                            ),
                            Text(
                              StringConstants.privacyPolicy.tr,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 12.px,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () {},
                text: StringConstants.login.tr,
              ),
              SizedBox(height: 16.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.alreadyHaveAccount.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 14.px,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      StringConstants.loginCaps.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14.px,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.px),

            ],
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
