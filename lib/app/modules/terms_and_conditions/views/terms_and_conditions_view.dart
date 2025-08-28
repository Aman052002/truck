import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/image_constants.dart';
import '../../../../language/string_constants.dart';
import '../controllers/terms_and_conditions_controller.dart';

class TermsAndConditionsView extends GetView<TermsAndConditionsController> {
  const TermsAndConditionsView({super.key});
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
                CommonWidgets.appBarView(title: StringConstants.termsAndConditions.tr),
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
                      SizedBox(height: 12.px),
                      Image.asset(
                        ImageConstants.imagePrivacy,
                        height: 220.px,
                        width: 220.px,
                      ),
                      SizedBox(height: 16.px),
                      detailsView(StringConstants.terms.tr, StringConstants.privacyDetail),
                      SizedBox(height: 26.px),
                      detailsView(StringConstants.howItWork.tr, StringConstants.howItWorkDetail),
                      SizedBox(height: 20.px),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsView(String title, String details){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(
            fontSize: 18.px,
            fontWeight: FontWeight.w700,
            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
          ),
        ),
        SizedBox(height: 10.px),
        Text(
          details,
          style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(
            fontSize: 12.px,
            fontWeight: FontWeight.w400,
            color: Theme.of(Get.context!).colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
