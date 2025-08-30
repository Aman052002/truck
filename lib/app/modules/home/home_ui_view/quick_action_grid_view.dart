import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';
import 'package:truck/app/routes/app_pages.dart';
import 'package:truck/common/cm.dart';

import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';

class QuickActionGridView extends StatelessWidget {
  final HomeController controller;
  const QuickActionGridView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        "icon": IconConstantsSvg.icNewTrip,
        "title": StringConstants.newTrip.tr,
      },
      {
        "icon": IconConstantsSvg.icMyTrips,
        "title": StringConstants.myTrips.tr,
      },
      {
        "icon": IconConstantsSvg.icExpenses,
        "title": StringConstants.expenses.tr,
      },
      {
        "icon": IconConstantsSvg.icMaintenance,
        "title": StringConstants.maintenance.tr,
      }
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.px,
        crossAxisSpacing: 16.px,
        childAspectRatio: 1.4,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 2.px),
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if(index == 0){
              Get.toNamed(Routes.TRIP_MANAGEMENT,parameters: {'tabValue': StringConstants.newTrip.tr});
            }
            else if(index == 1){
              Get.toNamed(Routes.TRIP_MANAGEMENT,parameters: {'tabValue': StringConstants.myTrips.tr});
            }
            else if(index == 2){
              Get.toNamed(Routes.EXPENSE,parameters: {'tabValue': StringConstants.addExpense.tr});
            }
          },
          child: Container(
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
              spacing: 10.px,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonMethods.appIcons(
                  assetName: list[index]['icon'].toString(),
                  height: 48.px,
                  width: 48.px,
                ),
                Text(
                  list[index]['title'].toString(),
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                    fontSize: 14.px,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
