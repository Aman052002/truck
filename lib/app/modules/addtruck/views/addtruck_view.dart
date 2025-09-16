import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../controllers/addtruck_controller.dart';

class AddtruckView extends GetView<AddtruckController> {
  const AddtruckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          children: [
            SizedBox(height: 6.px),
            CommonWidgets.appBarView(title: StringConstants.addTruckInfo.tr),
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
                  SizedBox(height: 20.px),
                  fieldTitleTextView(
                    StringConstants.truckName.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterTruckName.tr,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.truckNumberNew.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterTruckNumber.tr,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.truckModelNew.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterTruckModel.tr,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.mileageNew.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterMileage.tr,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.lastServiceDate.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.dateFormat.tr,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.insuranceExpiry.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.dateFormat.tr,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => Get.back(),
                    text: StringConstants.saveTruckInfo.tr,
                  ),
                ],
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 16.px),
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
            fontSize: 14,
          ),
        ),
        child,
      ],
    );
  }
}
