import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/background_image.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  const ClientsView({super.key});
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
                CommonWidgets.appBarView(title: StringConstants.clients.tr),
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
                                    assetName: IconConstantsSvg.icPerson,
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
                                            "John Doe Constructions",
                                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                              fontSize: 16.px,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "₹2,45,000",
                                          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                            fontSize: 16.px,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Last trip info
                                    Text(
                                      "${StringConstants.lastTrip.tr}: Today, 3:45 PM",
                                      style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(Get.context!).colorScheme.surface,
                                        fontSize: 14.px,
                                      ),
                                    ),
                                    // Extra info
                                    Text(
                                      "${StringConstants.trips.tr}: 56 | ${StringConstants.contacts.tr}: +91 98765 43210", // 👈 info line
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
                        ).paddingOnly(bottom: 10.px)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: addBtnView(),
    );
  }

  Widget addBtnView() {
    return FloatingActionButton(
      onPressed: ()=> Get.toNamed(Routes.ADD_CLIENT),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.px),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(Get.context!).colorScheme.onPrimary,
      ),
    );
  }

}
