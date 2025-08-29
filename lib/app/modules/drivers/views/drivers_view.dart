import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/constants/icons_constant.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../constants/image_constants.dart';
import '../../../../language/string_constants.dart';
import '../controllers/drivers_controller.dart';

class DriversView extends GetView<DriversController> {
  const DriversView({super.key});

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
                CommonWidgets.appBarView(title: StringConstants.drivers.tr),
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
                      Column(
                        spacing: 10.px,
                        children: List.generate(
                          5,
                          (index) => Container(
                            padding: EdgeInsets.all(16.px),
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
                              color: Theme.of(
                                Get.context!,
                              ).scaffoldBackgroundColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12.px,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    ImageConstants.imageAppLogo,
                                    height: 50.px,
                                    width: 50.px,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              StringConstants.michaelJohnson.tr,
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        Theme.of(Get.context!)
                                                            .colorScheme
                                                            .onPrimaryContainer,
                                                    fontSize: 14.px,
                                                  ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            '4.8',
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(
                                                    Get.context!,
                                                  ).colorScheme.surface,
                                                  fontSize: 12.px,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        StringConstants
                                            .yearsExperienceSedanSUV
                                            .tr,
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(
                                                Get.context!,
                                              ).colorScheme.surface,
                                              fontSize: 12.px,
                                            ),
                                      ),
                                      SizedBox(height: 8.px),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$25/hr',
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(
                                                    Get.context!,
                                                  ).colorScheme.primary,
                                                  fontSize: 18.px,
                                                ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xffDCFCE7),
                                              borderRadius:
                                                  BorderRadius.circular(16.px),
                                            ),
                                            child: Text(
                                              StringConstants.available.tr,
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff15803D),
                                                    fontSize: 12.px,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            height: 36.px,
                                            width: 90.px,
                                            decoration: BoxDecoration(
                                              // gradient: CommonMethods.commonLinearGradientView(),
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8.px),
                                            ),
                                            child: Row(
                                              spacing: 6.px,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonMethods.appIcons(
                                                  assetName:
                                                      IconConstantsSvg.icBook,
                                                  width: 16.px,
                                                  height: 16.px,
                                                ),
                                                Text(
                                                  StringConstants.book.tr,
                                                  style: Theme.of(Get.context!)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Theme.of(
                                                          Get.context!,
                                                        ).colorScheme.onPrimary,
                                                        fontSize: 16.px,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 2.px),
                      SizedBox(height: 12.px),
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
