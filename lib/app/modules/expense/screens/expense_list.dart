import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/expense/controllers/expense_controller.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/constants/icons_constant.dart';

import '../../../../language/string_constants.dart';

class ExpenseList extends StatelessWidget {
  final ExpenseController controller;
  const ExpenseList({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.px),
        Column(
          children: List.generate(4, (index) => Container(
            padding: EdgeInsets.all(12.px),
            margin: EdgeInsets.symmetric(horizontal: 2.px),
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
            child: Row(
              spacing: 10.px,
              children: [
                Container(
                  height: 40.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(60),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child: Center(
                    child: CommonMethods.appIcons(
                      assetName: IconConstantsSvg.icFuel,
                      height: 18.px,
                      width: 18.px,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              StringConstants.fuel.tr,
                              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                fontSize: 16.px,
                              ),
                            ),
                          ),
                          Text(
                            '\$45.20',
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 16.px,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Today, 3:45 PM',
                        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(Get.context!).colorScheme.surface,
                          fontSize: 14.px,
                        ),
                      ),
                      Text(
                        StringConstants.tripDowntownToAirport.tr,
                        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(Get.context!).colorScheme.primary,
                          fontSize: 12.px,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           ).paddingOnly(bottom: 10.px),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.px),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
            BorderRadius.circular(8.px),
          ),
          child: Column(
            children: [
              Text(
                StringConstants.totalExpensesThisWeek.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                  fontSize: 14.px,
                ),
              ),
              Text(
                '\$68.70',
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                  fontSize: 22.px,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.px),
      ],
    );
  }
}
