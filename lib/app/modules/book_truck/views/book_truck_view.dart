import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/book_truck_controller.dart';

class BookTruckView extends GetView<BookTruckController> {
  const BookTruckView({super.key});
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
                CommonWidgets.appBarView(title: StringConstants.bookTruck.tr),
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
                      tripDateTimeFieldView(),
                      SizedBox(height: 12.px),
                      selectClientFieldView(),
                      SizedBox(height: 12.px),
                      selectDriverFieldView(),
                      SizedBox(height: 12.px),
                      tripStartLocationFieldView(),
                      SizedBox(height: 12.px),
                      noteFieldView(),
                      SizedBox(height: 30.px),
                      confirmBookingBtnView(),
                      SizedBox(height: 40.px),
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

  Widget fieldTitleTextView(String text, Widget child, {bool isOptional = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                  fontSize: 14.px,
                ),
              ),
            ),
            if(isOptional)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.px,vertical: 4.px),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(16.px),
                ),
                child: Text(
                  StringConstants.optional.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(Get.context!).colorScheme.surface,
                    fontSize: 12.px,
                  ),
                ),
              )
          ],
        ),
        Container(
          padding: EdgeInsets.all(16.px),
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
          child: child,
        )
      ],
    );
  }

  Widget tripDateTimeFieldView(){
    return fieldTitleTextView(
      StringConstants.tripDateTime.tr,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.px,
        children: [
          Text(
            StringConstants.dateTime.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(Get.context!).colorScheme.surface,
              fontSize: 14.px,
            ),
          ),
          CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.dateTimeController,
            onTap: () => controller.pickDateTime(),
            hintText: StringConstants.selectDateTime.tr,
            readOnly: true,
            suffixIcon: CommonMethods.appIcons(
              assetName: IconConstantsSvg.icCalendar,
              height: 16.px,
              width: 16.px,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 2.px),
    );
  }

  Widget selectClientFieldView() {
    return fieldTitleTextView(
      StringConstants.selectClient.tr,
      CommonWidgets.commonTextFieldForLoginSignUP(
        controller: controller.clientController,
        hintText: StringConstants.chooseClient.tr,
        focusNode: controller.clientFocusNode,
        isCard: controller.clientIsFalse.value,
        readOnly: true,
        suffixIcon: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            customButton: Icon(Icons.keyboard_arrow_down_outlined,size: 24.px),
            items: [StringConstants.client1.tr, StringConstants.client2.tr].map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              ),
            )).toList(),
            onChanged: (value) => controller.clientController.text = value ?? '',
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250,
              width: MediaQuery.of(Get.context!).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(height: 40.px),
          ),
        ),
      ).paddingSymmetric(horizontal: 2.px),
    );
  }

  Widget autoSelectDriverView() {
    return Obx(() {
      Color selectedColor = controller.isAutoSelectDriveValue.value
          ? Theme.of(Get.context!).primaryColor
          : Theme.of(Get.context!).colorScheme.surface;
      return GestureDetector(
        onTap: () => controller.isAutoSelectDriveValue.value = !controller.isAutoSelectDriveValue.value,
        child: Container(
          height: 50.px,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.px),
          decoration: BoxDecoration(
            color: controller.isAutoSelectDriveValue.value
                ? Theme.of(Get.context!).primaryColor.withAlpha(10)
                : Colors.transparent,
            border: Border.all(
              color: controller.isAutoSelectDriveValue.value
                  ? Theme.of(Get.context!).primaryColor
                  : Theme.of(Get.context!).colorScheme.onSecondaryContainer,
            ),
            borderRadius: BorderRadius.circular(10.px),
          ),
          child: Row(
            spacing: 6.px,
            children: [
              Container(
                width: 16.px,
                height: 16.px,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor,
                    width: 2.px,
                  ),
                ),
                child: controller.isAutoSelectDriveValue.value
                    ? Container(
                  height: 14.px,
                  width: 14.px,
                  margin: EdgeInsets.all(2.px),
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).primaryColor,
                    shape: BoxShape.circle,
                  ),
                )
                    : SizedBox(),
              ),
              Expanded(
                child: Text(
                  StringConstants.autoAssignDriver.tr,
                  style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.px,
                    fontWeight: FontWeight.w600,
                    color: selectedColor,
                  ),
                ),
              ),
              CommonMethods.appIcons(
                assetName: IconConstantsSvg.icMagic,
                color: selectedColor,
              ),
            ],
          ),
        ),
      );
    },);
  }

  Widget selectDriverFieldView() {
    return fieldTitleTextView(
      StringConstants.selectDriver.tr,
      Obx(() => Column(
        spacing: 10.px,
        children: [
          autoSelectDriverView(),
          if(!controller.isAutoSelectDriveValue.value)
            CommonWidgets.commonTextFieldForLoginSignUP(
              controller: controller.driverController,
              hintText: StringConstants.chooseDriver.tr,
              focusNode: controller.driverFocusNode,
              isCard: controller.driverIsFalse.value,
              readOnly: true,
              suffixIcon: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  customButton: Icon(Icons.keyboard_arrow_down_outlined,size: 24.px),
                  items: [StringConstants.driver1.tr, StringConstants.driver2.tr].map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  )).toList(),
                  onChanged: (value) => controller.driverController.text = value ?? '',
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 250,
                    width: MediaQuery.of(Get.context!).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(height: 40.px),
                ),
              ),
            ),
        ],
      ),).paddingSymmetric(horizontal: 2.px),
      isOptional: true,
    );
  }

  Widget tripStartLocationFieldView() {
    return fieldTitleTextView(
      StringConstants.tripStartLocation.tr,
      Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.px,
        children: [
          CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.tripStartLocationController,
            hintText: StringConstants.enterPickupLocation.tr,
            focusNode: controller.tripStartLocationFocusNode,
            isCard: controller.tripStartLocationIsFalse.value,
            suffixIcon: Icon(Icons.location_on_sharp,size: 18.px),
            maxLines: 5,
            minLines: 2,
          ),
          controller.currentLocationLoadingValue.value
              ? SizedBox(
            height: 16.px,
            width: 16.px,
            child: CircularProgressIndicator(
              strokeWidth: 2.px,
            ),
          )
              :GestureDetector(
            onTap: controller.clickOnCurrentLocation,
            child: Row(
              spacing: 4.px,
              children: [
                Icon(
                  Icons.my_location,
                  size: 16.px,
                  color: Theme.of(Get.context!).primaryColor,
                ),
                Text(
                  StringConstants.useCurrentLocation.tr,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(Get.context!).primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),).paddingSymmetric(horizontal: 2.px),
    );
  }

  Widget noteFieldView() {
    return fieldTitleTextView(
      StringConstants.notes.tr,
      CommonWidgets.commonTextFieldForLoginSignUP(
        controller: controller.noteController,
        hintText: StringConstants.addNotes.tr,
        focusNode: controller.noteFocusNode,
        maxLines: 5,
        minLines: 2,
      ).paddingSymmetric(horizontal: 2.px),
    );
  }

  Widget confirmBookingBtnView() {
    return Container(
      width: double.infinity,
      height: 48.px,
      decoration: BoxDecoration(
        color: Color(0xff2563EB),
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6.px,
        children: [
          CommonMethods.appIcons(
            assetName: IconConstantsSvg.icTruck,
            color: Theme.of(Get.context!).colorScheme.onPrimary,
          ),
          Text(
            StringConstants.confirmBooking.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(Get.context!).colorScheme.onPrimary,
              fontSize: 16.px,
            ),
          ),
        ],
      ),
    );
  }
}
