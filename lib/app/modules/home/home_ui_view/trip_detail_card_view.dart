import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';

import '../../../../common/cm.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';

class TripDetailCardView extends StatelessWidget {
  final HomeController controller;
  const TripDetailCardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.px),
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
        spacing: 8.px,
        children: [
          Row(
            spacing: 10.px,
            children: [
              Expanded(
                child: Text(
                  StringConstants.nextTrip.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(
                      Get.context!,
                    ).colorScheme.onPrimaryContainer,
                    fontSize: 18.px,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.px, horizontal: 8.px),
                decoration: BoxDecoration(
                  color: Color(0xffF59E0B),
                  borderRadius: BorderRadiusGeometry.circular(14.px),
                ),
                child: Text(
                  StringConstants.scheduled.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    fontSize: 14.px,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.px),
          Row(
            spacing: 10.px,
            children: [
              CommonMethods.appIcons(assetName: IconConstantsSvg.icPerson),
              Expanded(
                child: Text(
                  StringConstants.globalLogistics.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(
                      Get.context!,
                    ).colorScheme.onPrimaryContainer,
                    fontSize: 14.px,
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.px,
            children: [
              CommonMethods.appIcons(assetName: IconConstantsSvg.icTruck),
              Expanded(
                child: Text(
                  StringConstants.truckNumber.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(
                      Get.context!,
                    ).colorScheme.onPrimaryContainer,
                    fontSize: 14.px,
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.px,
            children: [
              CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
              Expanded(
                child: Text(
                  StringConstants.tripStartTime.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(
                      Get.context!,
                    ).colorScheme.onPrimaryContainer,
                    fontSize: 14.px,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.px),
          Container(
            width: double.infinity,
            height: 48.px,
            decoration: BoxDecoration(
              color: Color(0xff2563EB),
              borderRadius: BorderRadius.circular(8.px),
            ),
            child: Center(
              child: Text(
                StringConstants.startTrip.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                  fontSize: 16.px,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
