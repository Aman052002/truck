import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/trucks_controller.dart';

class TrucksView extends GetView<TrucksController> {
  const TrucksView({super.key});

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
                CommonWidgets.appBarView(title: StringConstants.trucks.tr),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.px,
                          children: [
                            SizedBox(
                              height: 44.px,
                              child: CommonWidgets.commonTextFieldForLoginSignUP(
                                leftPaddingIfWant: false,
                                prefixIcon: CommonMethods.appIcons(
                                  assetName: IconConstantsSvg.icSearch,
                                  height: 16.px,
                                  width: 16.px,
                                ),
                                textInputAction: TextInputAction.search,
                                hintText: StringConstants.searchByTruckIdOrPlate.tr,
                              ),
                            ),
                            Obx(() => Wrap(
                              spacing: 8.px,
                              runSpacing: 8.px,
                              children: List.generate(controller.filterList.length,
                                    (index) => GestureDetector(
                                  onTap: () => controller.selectedFilterValue.value = controller.filterList[index],
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 4.px,horizontal: 12.px),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.px),
                                      color: controller.filterList[index] == controller.selectedFilterValue.value
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).colorScheme.onSurface,
                                    ),
                                    child: Text(
                                      controller.filterList[index],
                                      style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: controller.filterList[index] == controller.selectedFilterValue.value
                                            ? Theme.of(Get.context!).colorScheme.onPrimary
                                            : Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                        fontSize: 12.px,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ).paddingSymmetric(horizontal: 2.px),
                      ),
                      SizedBox(height: 12.px),
                      Column(
                        children: List.generate(
                          10, (index) => Container(
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
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      StringConstants.truckId.tr, // 'TRK-001'
                                      style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                        fontSize: 16.px,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffDCFCE7),
                                      borderRadius:
                                      BorderRadius.circular(16.px),
                                    ),
                                    child: Text(
                                      StringConstants.available.tr,
                                      style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff15803D),
                                        fontSize: 12.px,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                StringConstants.truckModel.tr, // 'Mercedes Actors 2545'
                                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(Get.context!).colorScheme.surface,
                                  fontSize: 14.px,
                                ),
                              ),
                              SizedBox(height: 8.px),
                              Row(
                                spacing: 10.px,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.lastTrip.tr,
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(Get.context!).colorScheme.surface,
                                            fontSize: 12.px,
                                          ),
                                        ),
                                        Text(
                                          StringConstants.lastTripDate.tr, // 'Dec 15, 2024'
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                            fontSize: 14.px,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.mileage.tr,
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(Get.context!).colorScheme.surface,
                                            fontSize: 12.px,
                                          ),
                                        ),
                                        Text(
                                          StringConstants.mileageValue.tr, // '145,230 km'
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                            fontSize: 14.px,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.px),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                spacing: 10.px,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 36.px,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          width: 1.5.px,
                                        ),
                                        borderRadius: BorderRadius.circular(8.px),
                                      ),
                                      child: Center(
                                        child: Text(
                                          StringConstants.viewDetails.tr,
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                            fontSize: 14.px,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => controller.clickOnBookTruckBtn(),
                                      child: Container(
                                        height: 36.px,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                          BorderRadius.circular(8.px),
                                        ),
                                        child: Center(
                                          child: Text(
                                            StringConstants.bookTruck.tr,
                                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(Get.context!).colorScheme.onPrimary,
                                              fontSize: 14.px,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10.px),
                        ),
                      ),
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
}
