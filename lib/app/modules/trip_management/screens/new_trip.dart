import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/trip_management/controllers/trip_management_controller.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/constants/icons_constant.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';

class NewTrip extends StatelessWidget {
  final TripManagementController controller;
  const NewTrip({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commonCardView(
          icon: IconConstantsSvg.icTruck,
          title: StringConstants.tripSetup.tr,
          child: Column(
            spacing: 12.px,
            children: [
              fieldTitleTextView(
                StringConstants.selectClient.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.clientController,
                  hintText: StringConstants.chooseClient.tr,
                  focusNode: controller.clientFocusNode,
                  readOnly: true,
                  suffixIcon: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      customButton: Icon(Icons.keyboard_arrow_down_outlined,size: 24.px),
                      items: [
                        StringConstants.client1.tr,
                        StringConstants.client2.tr,
                      ].map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 14)),
                      )).toList(),
                      onChanged: (value) => controller.clientController.text = value ?? '',
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 250,
                        width: MediaQuery.of(Get.context!).size.width * 0.9,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      ),
                      menuItemStyleData: MenuItemStyleData(height: 40.px),
                    ),
                  ),
                ),
              ),
              fieldTitleTextView(
                StringConstants.selectTruck.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.truckController,
                  hintText: StringConstants.chooseTruck.tr,
                  focusNode: controller.truckFocusNode,
                  readOnly: true,
                  suffixIcon: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      customButton: Icon(Icons.keyboard_arrow_down_outlined,size: 24.px),
                      items: [
                        StringConstants.truck1.tr,
                        StringConstants.truck2.tr,
                      ].map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 14)),
                      )).toList(),
                      onChanged: (value) => controller.truckController.text = value ?? '',
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 250,
                        width: MediaQuery.of(Get.context!).size.width * 0.9,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      ),
                      menuItemStyleData: MenuItemStyleData(height: 40.px),
                    ),
                  ),
                ),
              ),
              fieldTitleTextView(
                StringConstants.tripDate.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.tripDateController,
                  hintText: StringConstants.selectTripDate.tr,
                  focusNode: controller.tripDateFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(
                    assetName: IconConstantsSvg.icCalendar,
                    height: 16.px,
                    width: 16.px,
                  ),
                ),
              ),
            ],
          ),
        ),

        commonCardView(
          icon: IconConstantsSvg.icDeparture,
          title: StringConstants.departure.tr,
          child: Column(
            spacing: 12.px,
            children: [
              fieldTitleTextView(
                StringConstants.departureTime.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.departureTimeController,
                  hintText: StringConstants.selectDepartureTime.tr,
                  focusNode: controller.departureTimeFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
                ),
              ),
              fieldTitleTextView(
                StringConstants.gpsCoordinates.tr,
                Row(
                  spacing: 10.px,
                  children: [
                    Expanded(
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.gPSCoordinatesController,
                        hintText: StringConstants.enterHere.tr,
                        focusNode: controller.gPSCoordinatesFocusNode,
                      ),
                    ),
                    Container(
                      height: 48.px,
                      width: 44.px,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.px),
                      ),
                      child: Icon(Icons.my_location,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20.px,
                      ),
                    )
                  ],
                ),
              ),
              fieldTitleTextView(
                StringConstants.kmToDestination.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.kmToDestinationController,
                  hintText: StringConstants.enterDistanceInKm.tr,
                  focusNode: controller.kmToDestinationFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
                ),
              ),
              SizedBox(),
              commonBtnView(icon: IconConstantsSvg.icDeparture, title: StringConstants.startTrip.tr),
            ],
          ),
        ),

        commonCardView(
          icon: IconConstantsSvg.icArrival,
          title: StringConstants.arrivalAtUnloading.tr,
          child: Column(
            spacing: 12.px,
            children: [
              fieldTitleTextView(
                StringConstants.arrivalTime.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.arrivalTimeController,
                  hintText: StringConstants.selectArrivalTime.tr,
                  focusNode: controller.arrivalTimeFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
                ),
              ),
              fieldTitleTextView(
                StringConstants.gpsCoordinates.tr,
                Row(
                  spacing: 10.px,
                  children: [
                    Expanded(
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.arrivalGPSCoordinatesController,
                        hintText: StringConstants.enterHere.tr,
                        focusNode: controller.arrivalGPSCoordinatesFocusNode,
                      ),
                    ),
                    Container(
                      height: 48.px,
                      width: 44.px,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.px),
                      ),
                      child: Icon(Icons.my_location,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20.px,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(),
              commonBtnView(icon: IconConstantsSvg.icCheck, title: StringConstants.markArrival.tr),
            ],
          ),
        ),

        commonCardView(
          icon: IconConstantsSvg.icUnloading,
          title: StringConstants.unloading.tr,
          child: Column(
            spacing: 12.px,
            children: [
              fieldTitleTextView(
                StringConstants.startTime.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.startTimeController,
                  hintText: StringConstants.timePlaceholder.tr,
                  focusNode: controller.startTimeFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
                ),
              ),
              fieldTitleTextView(
                StringConstants.endTimeOptional.tr,
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.endTimeController,
                  hintText: StringConstants.timePlaceholder.tr,
                  focusNode: controller.endTimeFocusNode,
                  readOnly: true,
                  suffixIcon: CommonMethods.appIcons(assetName: IconConstantsSvg.icClock),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: Row(
                  spacing: 6.px,
                  children: [
                    CommonMethods.appIcons(
                      assetName: IconConstantsSvg.icClock,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      StringConstants.waitingTimeAuto.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 80.px),
      ],
    );
  }

  Widget commonCardView({required String icon, required String title, required Widget child}){
    return Container(
      margin: EdgeInsets.only(top: 12.px),
      padding: EdgeInsets.symmetric(vertical: 16.px),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(Get.context!).colorScheme.surface.withAlpha(80),
        ),
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: Column(
        children: [
          Row(
            spacing: 6.px,
            children: [
              CommonMethods.appIcons(
                assetName: icon,
                color: Theme.of(Get.context!).primaryColor,
              ),
              Text(
                title,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                  fontSize: 16.px,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16.px),
          Divider(
            color: Theme.of(Get.context!).colorScheme.surface.withAlpha(40),
            height: 30.px,
          ),
          child.paddingSymmetric(horizontal: 16.px),
        ],
      ),
    );
  }

  Widget fieldTitleTextView(String text, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          text,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
            fontSize: 14.px,
          ),
        ),
        child,
      ],
    );
  }

  Widget commonBtnView({required String icon, required String title,GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.px,
        decoration: BoxDecoration(
          // color: Color(0xff2563EB),
          color: Theme.of(Get.context!).primaryColor,
          borderRadius: BorderRadius.circular(8.px),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6.px,
          children: [
            CommonMethods.appIcons(
              assetName: icon,
              color: Theme.of(Get.context!).colorScheme.onPrimary,
              width: 20.px,
              height: 20.px,
            ),
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(Get.context!).colorScheme.onPrimary,
                fontSize: 16.px,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
