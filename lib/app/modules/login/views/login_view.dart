import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/routes/app_pages.dart';
import 'package:truck/common/background_image.dart';
import 'package:truck/common/cw.dart';
import '../../../../common/cm.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 70.px),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.login.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 18.px,
                          ),
                        ),
                        Text(
                          StringConstants.loginWithUs.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 18.px,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          StringConstants.emailOrMobile.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 14.px,
                          ),
                        ),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          keyboardType: TextInputType.emailAddress,
                          hintText: StringConstants.emailOrMobileHint.tr,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          StringConstants.password.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 14.px,
                          ),
                        ),
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
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.px),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                        child: Text(
                          StringConstants.forgotPassword.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14.px,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
                          ? Get.offAllNamed(Routes.HOME)
                          : Get.offAllNamed(Routes.BOTTOM_BAR),
                      text: StringConstants.loginButton.tr,
                    ),
                    if(!kIsWeb && (Platform.isAndroid || Platform.isIOS))...[
                      SizedBox(height: 16.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.dontHaveAccount.tr,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 14.px,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.SIGNUP),
                            child: Text(
                              StringConstants.register.tr,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 14.px,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
                if(!kIsWeb && (Platform.isAndroid || Platform.isIOS))...[
                  Spacer(),
                  Text(
                    StringConstants.bySigningIn.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 12.px,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 16.px),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
