import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/constants/image_constants.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                      StringConstants.forgotPasswordTitle.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 22.px,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.px),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: StringConstants.forgotPasswordSubTitle.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 12.px,
                        ),
                        children: [
                          TextSpan(
                            text: StringConstants.oneTimePasscode.tr,
                            style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 12.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.px),
                  Center(
                    child: Image.asset(
                      ImageConstants.imageEmail,
                      height: 166.px,
                    ),
                  ),
                  SizedBox(height: 30.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        StringConstants.phoneNumber.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 14.px,
                        ),
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        keyboardType: TextInputType.number,
                        hintText: StringConstants.phoneNumberHint.tr,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => Get.toNamed(Routes.OTP),
                    text: StringConstants.sendOtp.tr,
                  ),
                  SizedBox(height: 16.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.backTo.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 14.px,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          StringConstants.login.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color:
                            Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14.px,
                          ),
                        ),
                      ),
                    ],
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
}
