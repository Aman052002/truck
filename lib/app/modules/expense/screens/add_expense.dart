import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/expense/controllers/expense_controller.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/constants/icons_constant.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';

class AddExpense extends StatelessWidget {
  final ExpenseController controller;
  const AddExpense({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.px),
      margin: EdgeInsets.symmetric(horizontal: 2.px, vertical: 12.px),
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
      child: Obx(
            () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.addNewExpense.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 16.px,
              ),
            ),
            SizedBox(height: 16.px),
            Text(
              StringConstants.expenseType.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 12.px,
              ),
            ),
            SizedBox(height: 8.px),
            Row(
              spacing: 8.px,
              children: [
                Expanded(
                  child: commonExpenseTypeCardView(
                    title: StringConstants.fuel.tr,
                    icon: IconConstantsSvg.icFuel,
                    onTap: () => controller.selectedExpenseTypeValue.value =
                        StringConstants.fuel.tr,
                    isSelected: controller.selectedExpenseTypeValue.value ==
                        StringConstants.fuel.tr,
                  ),
                ),
                Expanded(
                  child: commonExpenseTypeCardView(
                    title: StringConstants.toll.tr,
                    icon: IconConstantsSvg.icToll,
                    onTap: () => controller.selectedExpenseTypeValue.value =
                        StringConstants.toll.tr,
                    isSelected: controller.selectedExpenseTypeValue.value ==
                        StringConstants.toll.tr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.px),
            Row(
              spacing: 8.px,
              children: [
                Expanded(
                  child: commonExpenseTypeCardView(
                    title: StringConstants.repair.tr,
                    icon: IconConstantsSvg.icRepair,
                    onTap: () => controller.selectedExpenseTypeValue.value =
                        StringConstants.repair.tr,
                    isSelected: controller.selectedExpenseTypeValue.value ==
                        StringConstants.repair.tr,
                  ),
                ),
                Expanded(
                  child: commonExpenseTypeCardView(
                    title: StringConstants.other.tr,
                    icon: IconConstantsSvg.icAdd,
                    onTap: () => controller.selectedExpenseTypeValue.value =
                        StringConstants.other.tr,
                    isSelected: controller.selectedExpenseTypeValue.value ==
                        StringConstants.other.tr,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.px),
            Text(
              StringConstants.amount.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 12.px,
              ),
            ),
            SizedBox(height: 8.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              hintText: StringConstants.zeroAmount.tr,
              leftPaddingIfWant: false,
              prefixIcon: CommonMethods.appIcons(
                assetName: IconConstantsSvg.icDollar,
                height: 16.px,
                width: 16.px,
              ),
            ),
            SizedBox(height: 12.px),
            Text(
              StringConstants.linkToTrip.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 12.px,
              ),
            ),
            SizedBox(height: 8.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              hintText: StringConstants.selectTrip.tr,
              readOnly: true,
              suffixIcon: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  customButton:
                  Icon(Icons.keyboard_arrow_down_outlined, size: 24.px),
                  items: [
                    StringConstants.trip1,
                    StringConstants.trip2
                  ].map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  )).toList(),
                  onChanged: (value) => StringConstants.selectTrip,
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
            SizedBox(height: 12.px),
            Text(
              StringConstants.notes.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 12.px,
              ),
            ),
            SizedBox(height: 8.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              hintText: StringConstants.notesHint.tr,
              maxLines: 5,
              minLines: 2,
            ),
            SizedBox(height: 12.px),
            Text(
              StringConstants.receiptPhoto.tr,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 12.px,
              ),
            ),
            SizedBox(height: 8.px),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.px),
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  strokeWidth: 2,
                  padding: EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                ),
                child: Column(
                  children: [
                    CommonMethods.appIcons(assetName: IconConstantsSvg.icCamera),
                    SizedBox(height: 8.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.tapToAddReceipt.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      StringConstants.chooseFromGallery.tr,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(Get.context!).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () {},
              text: StringConstants.saveExpense.tr,
            )
          ],
        ),
      ),
    );
  }

  Widget commonExpenseTypeCardView({
    bool isSelected = false,
    required String title,
    required String icon,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.px),
          border: Border.all(
            color: Theme.of(Get.context!).colorScheme.surface.withAlpha(40),
          ),
          color: isSelected
              ? Theme.of(Get.context!).colorScheme.primary
              : Colors.transparent,
        ),
        child: Column(
          spacing: 2.px,
          children: [
            CommonMethods.appIcons(
              assetName: icon,
              color: isSelected
                  ? Theme.of(Get.context!).colorScheme.onPrimary
                  : Theme.of(Get.context!).colorScheme.surface,
              width: 20.px,
              height: 20.px,
            ),
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Theme.of(Get.context!).colorScheme.onPrimary
                    : Theme.of(Get.context!).colorScheme.surface,
                fontSize: 16.px,
              ),
            )
          ],
        ),
      ),
    );
  }
}
