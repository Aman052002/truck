import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                CommonWidgets.backIconBtnView(),
                SizedBox(height: 30.px),
                Center(
                  child: Text(
                    StringConstants.enterOtp.tr,
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
                      text: StringConstants.otpSentMessage.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12.px,
                      ),
                      children: [
                        TextSpan(
                          text: StringConstants.maskedMobile.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 12.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.px),
                Center(
                  child: Text(
                    StringConstants.changeMobileNumber.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14.px,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                SizedBox(height: 36.px),
                CommonWidgets.commonOtpView(),
                SizedBox(height: 20.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => Get.toNamed(Routes.PASSWORD_CHANGE),
                  text: StringConstants.submit.tr,
                ),
                SizedBox(height: 16.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.resend.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14.px,
                      ),
                    ),
                    Text(
                      StringConstants.otpAgain.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 14.px,
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
    );
  }
}
