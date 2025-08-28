import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';

import '../../../../language/string_constants.dart';

class ProgressCardView extends StatelessWidget {
  final HomeController controller;
  const ProgressCardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
        color: Color(0xff2563EB),
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  StringConstants.monthlyProgress.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    fontSize: 16.px,
                  ),
                ),
              ),
              Text(
                '74%',
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                  fontSize: 20.px,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.px),
          Row(
            children: [
              Expanded(
                child: Text(
                  StringConstants.salaryProgress.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    fontSize: 14.px,
                  ),
                ),
              ),
              Text(
                StringConstants.salaryProgressValue.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                  fontSize: 14.px,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.px),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(5.px),
            child: LinearProgressIndicator(
              value: .74,
              backgroundColor: Theme.of(
                Get.context!,
              ).colorScheme.onPrimary.withAlpha(76),
              color: Theme.of(Get.context!).colorScheme.onPrimary,
              minHeight: 10.px,
            ),
          ),
          SizedBox(height: 10.px),
          Text(
            StringConstants.tripsRemaining.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(Get.context!).colorScheme.onPrimary,
              fontSize: 16.px,
            ),
          ),
        ],
      ),
    );
  }
}
