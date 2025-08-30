import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/trip_management/screens/my_trips.dart';
import 'package:truck/app/modules/trip_management/screens/new_trip.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../controllers/trip_management_controller.dart';

class TripManagementView extends GetView<TripManagementController> {
  const TripManagementView({super.key});

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
                CommonWidgets.appBarView(title: StringConstants.tripManagement.tr),
                SizedBox(height: 20.px),
                Divider(
                  thickness: 1.px,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                  indent: 5.px,
                  endIndent: 5.px,
                  height: 0.px,
                ),
                tabBarView(),
                Expanded(
                  child: Obx(() {
                    return ListView(
                      children: [
                        controller.tabBarSelectedValue.value == StringConstants.myTrips.tr
                            ? MyTrips(controller: controller)
                            : NewTrip(controller: controller),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: addBtnView(),
    );
  }

  Widget tabBarView() {
    return Obx(() {
      var list = [StringConstants.newTrip.tr, StringConstants.myTrips.tr];
      return Row(
        children: List.generate(list.length, (index) {
          return Expanded(
            child: GestureDetector(
              // onTap: () => controller.tabBarSelectedValue.value = list[index],
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.px),
                decoration: BoxDecoration(
                  color: controller.tabBarSelectedValue.value == list[index]
                      ? Theme.of(Get.context!).primaryColor.withAlpha(10)
                      : Theme.of(Get.context!).colorScheme.onPrimary,
                  border: Border(
                    bottom: BorderSide(
                      color: controller.tabBarSelectedValue.value == list[index]
                          ? Theme.of(Get.context!).primaryColor
                          : Theme.of(Get.context!).colorScheme.surface.withAlpha(300),
                      width: controller.tabBarSelectedValue.value == list[index] ? 2.px : 1.px,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                      controller.tabBarSelectedValue.value == list[index]
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: controller.tabBarSelectedValue.value == list[index]
                          ? Theme.of(Get.context!).primaryColor
                          : Theme.of(Get.context!).colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    },);
  }

  Widget addBtnView() {
    return Obx(
          () =>
      controller.tabBarSelectedValue.value == StringConstants.newTrip.tr
          ? SizedBox()
          : FloatingActionButton(
        onPressed: () => controller.tabBarSelectedValue.value = StringConstants.newTrip.tr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.px),
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(Get.context!).colorScheme.onPrimary,
        ),
      ),
    );
  }

}
