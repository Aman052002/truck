import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../controllers/add_client_controller.dart';

class AddClientView extends GetView<AddClientController> {
  const AddClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          children: [
            SizedBox(height: 6.px),
            CommonWidgets.appBarView(title: StringConstants.addClientDetails.tr),
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
                    StringConstants.clientName.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterClientName.tr,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.contactNumber.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterContactNumber.tr,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.email.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterEmail.tr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.address.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterAddress.tr,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 16.px),
                  fieldTitleTextView(
                    StringConstants.revenueHistory.tr,
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterRevenueHistory.tr,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 24.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => Get.back(),
                    text: StringConstants.saveClientInfo.tr,
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
