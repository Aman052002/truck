import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/trip_management/controllers/trip_management_controller.dart';
import 'package:truck/common/cm.dart';

import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';

class MyTrips extends StatelessWidget {
  final TripManagementController controller;

  const MyTrips({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.px, vertical: 12.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.px),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(.1, .1),
                color: Theme.of(Get.context!).colorScheme.surface.withAlpha(50),
              ),
            ],
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.px,
                children: [
                  SizedBox(
                    height: 44.px,
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                      leftPaddingIfWant: false,
                      prefixIcon: CommonMethods.appIcons(
                        assetName: IconConstantsSvg.icSearch,
                        height: 16.px,
                        width: 16.px,
                      ),
                      hintText: StringConstants.searchTrips.tr,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ],
              ).paddingAll(16.px),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).primaryColor.withAlpha(25),
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(Get.context!).primaryColor.withAlpha(50),
                    )
                  )
                ),
                child: Row(
                  spacing: 8.px,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.totalTrips,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 12.px,
                            ),
                          ),
                          Text(
                            StringConstants.totalTripsCount,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 20.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.totalDistance,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 12.px,
                            ),
                          ),
                          Text(
                            StringConstants.totalDistanceValue,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 20.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.pendingSync,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 12.px,
                            ),
                          ),
                          Text(
                            StringConstants.pendingSyncCount,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(Get.context!).colorScheme.error,
                              fontSize: 20.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  spacing: 12.px,
                                  children: [
                                    Text(
                                      StringConstants.companyName,
                                      style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                        fontSize: 16.px,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 4.px),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffDCFCE7),
                                        borderRadius: BorderRadius.circular(14.px),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 4.px,
                                        children: [
                                          Container(
                                            height: 6.px,
                                            width: 6.px,
                                            decoration: const BoxDecoration(
                                              color: Color(0xff22C55E),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Text(
                                            StringConstants.synced,
                                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff15803D),
                                              fontSize: 10.px,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Theme.of(context).colorScheme.surface.withAlpha(90),
                              ),
                            ],
                          ),
                          Text(
                            StringConstants.tripTime,
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(Get.context!).colorScheme.surface.withAlpha(700),
                              fontSize: 14.px,
                            ),
                          ),
                          Row(
                            spacing: 6.px,
                            children: [
                              CommonMethods.appIcons(
                                assetName: IconConstantsSvg.icKM,
                                width: 12.px,
                                height: 12.px,
                              ),
                              Text(
                                StringConstants.tripDistance,
                                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(Get.context!).colorScheme.surface,
                                  fontSize: 14.px,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingAll(16.px),
                      Divider(height: 0.px),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
