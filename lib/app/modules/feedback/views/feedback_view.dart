import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/constants/image_constants.dart';

import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});

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
                CommonWidgets.appBarView(title: StringConstants.feedback.tr),
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
                        ImageConstants.imageFeedback,
                        height: 220.px,
                        width: 220.px,
                      ),
                      SizedBox(height: 16.px),

                      Text(
                        StringConstants.yourWorkIsDoneSuccessfully.tr,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 20.px,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.pleaseRateReoDonald.tr,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.px),
                      Image.asset(ImageConstants.imageStarIcon),
                      SizedBox(height: 16.px),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.px),
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
                        child: CommonWidgets.commonTextFieldForLoginSignUP(
                          minLines: 1,
                          maxLines: 6,
                          elevation: 0,
                          borderWidth: 0,
                          wantBorder: false,
                          keyboardType: TextInputType.multiline,
                          hintText: StringConstants.leaveReview.tr,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: IconConstantsSvg.icEdit,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () {},
                        text: StringConstants.submit.tr,
                      ),
                      SizedBox(height: 16.px),
                      Center(
                        child: Text(
                          StringConstants.skip.tr,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 16.px,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
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

}
