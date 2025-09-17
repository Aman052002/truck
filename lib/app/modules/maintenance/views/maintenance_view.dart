import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/background_image.dart';
import 'package:truck/common/cw.dart';
import 'package:truck/language/string_constants.dart';
import '../controllers/maintenance_controller.dart';

class MaintenanceView extends GetView<MaintenanceController> {
  const MaintenanceView({super.key});
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
                CommonWidgets.appBarView(title: StringConstants.truckMaintenance.tr),
                Divider(
                  thickness: 1.px,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                  indent: 5.px,
                  endIndent: 5.px,
                  height: 20.px,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.px),
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
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.px),
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(Get.context!).primaryColor,
                            child: Text(
                              'T ${index+1}',
                              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(Get.context!).scaffoldBackgroundColor,
                                fontSize: 12.px,
                              ),
                            ),
                          ),
                          title: Text(
                            "Truck ${index + 1}",
                            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                              fontSize: 14.px,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.px),
                              Text(
                                "Last Service: 01 Sept 2025",
                                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                  fontSize: 12.px,
                                ),
                              ),
                              Text(
                                "Next Due: 01 Dec 2025",
                                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                  fontSize: 12.px,
                                ),
                              ),
                              Text(
                                "ITP Expiry: 15 Oct 2025",
                                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                                  fontSize: 12.px,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
