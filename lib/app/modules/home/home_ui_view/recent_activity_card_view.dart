import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';

import '../../../../language/string_constants.dart';

class RecentActivityCardView extends StatelessWidget {
  final HomeController controller;
  const RecentActivityCardView({super.key, required this.controller});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.recentActivity.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
              fontSize: 18.px,
            ),
          ),
          SizedBox(height: 4.px),
          Row(
            spacing: 10.px,
            children: [
              Container(
                height: 36.px,
                width: 36.px,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDCFCE7),
                ),
                child: Icon(Icons.check, color: Color(0xff16A34A), size: 16.px),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.tripCompleted.tr,
                      style: Theme.of(Get.context!).textTheme.titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(
                          Get.context!,
                        ).colorScheme.onPrimaryContainer,
                        fontSize: 14.px,
                      ),
                    ),
                    Text(
                      StringConstants.tripRoute.tr,
                      style: Theme.of(Get.context!).textTheme.titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(Get.context!).colorScheme.surface,
                        fontSize: 12.px,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                StringConstants.timeAgo2h.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(Get.context!).colorScheme.surface,
                  fontSize: 12.px,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.px,
            children: [
              Container(
                height: 36.px,
                width: 36.px,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDBEAFE),
                ),
                child: Icon(
                  Icons.paypal,
                  color: Color(0xff2563EB),
                  size: 16.px,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.paymentReceived.tr,
                      style: Theme.of(Get.context!).textTheme.titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(
                          Get.context!,
                        ).colorScheme.onPrimaryContainer,
                        fontSize: 14.px,
                      ),
                    ),
                    Text(
                      StringConstants.paymentAmount.tr,
                      style: Theme.of(Get.context!).textTheme.titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(Get.context!).colorScheme.surface,
                        fontSize: 12.px,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                StringConstants.timeAgo5h.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(Get.context!).colorScheme.surface,
                  fontSize: 12.px,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
