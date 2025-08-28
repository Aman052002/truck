import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck/app/modules/drivers/views/drivers_view.dart';
import 'package:truck/app/modules/home/views/home_view.dart';
import 'package:truck/app/modules/reports/views/reports_view.dart';
import 'package:truck/app/modules/trucks/views/trucks_view.dart';
import '../../../../common/cm.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.onWillPop(),
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.activeIndex.value,
            children: [HomeView(), TrucksView(), DriversView(), ReportsView()],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(.1, .1),
                color: Theme.of(Get.context!).colorScheme.surface.withAlpha(50),
              ),
            ],
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
          ),
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.activeIndex.value,
              onTap: (index) {
                controller.activeIndex.value = index;
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.surface.withOpacity(0.6),
              items: (listOfBottomBothTabs(context: context))
                  .map((icon) => BottomNavigationBarItem(icon: icon, label: ''))
                  .toList(),
              elevation: 4,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }

  Widget button({
    required String image,
    required String text,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        controller.activeIndex.value = index;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonMethods.iconLinearGradient(
            assetName: image,
            value: controller.activeIndex.value == index,
          ),
          CommonMethods.textViewLinearGradient(
            text: text,
            value: controller.activeIndex.value == index,
          ),
        ],
      ),
    );
  }

  List<Widget> listOfBottomBothTabs({required BuildContext context}) {
    return [
      button(
        image: IconConstantsSvg.icHome,
        text: StringConstants.home.tr,
        index: 0,
      ),
      button(
        image: IconConstantsSvg.icTrucks,
        text: StringConstants.trucks.tr,
        index: 1,
      ),
      button(
        image: IconConstantsSvg.icDrivers,
        text: StringConstants.drivers.tr,
        index: 2,
      ),
      button(
        image: IconConstantsSvg.icReports,
        text: StringConstants.reports.tr,
        index: 3,
      ),
    ];
  }
}
