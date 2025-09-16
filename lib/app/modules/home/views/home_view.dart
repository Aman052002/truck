import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/home_ui_view/quick_action_grid_view.dart';
import 'package:truck/app/modules/home/home_ui_view/recent_activity_card_view.dart';
import 'package:truck/common/cw.dart';
import 'package:truck/constants/icons_constant.dart';
import '../../../../common/background_image.dart';
import '../../../../language/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../home_ui_view/admin_dashboard_view.dart';
import '../home_ui_view/drawer_view.dart';
import '../home_ui_view/progress_card_view.dart';
import '../home_ui_view/trip_detail_card_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 6.px),
                appBarView(),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 30.px),
                      if (kIsWeb) ...[
                        Text(
                          StringConstants.insides.tr,
                          style: Theme.of(Get.context!).textTheme.titleMedium
                              ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(
                              Get.context!,
                            ).colorScheme.onPrimaryContainer,
                            fontSize: 18.px,
                          ),
                        ),
                        SizedBox(height: 10.px),
                        AdminDashboardView(),
                        SizedBox(height: 16.px),
                      ],

                      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) ...[
                        ProgressCardView(controller: controller),
                        SizedBox(height: 16.px),
                        TripDetailCardView(controller: controller),
                        SizedBox(height: 16.px),
                      ],
                      Text(
                        StringConstants.quickActions.tr,
                        style: Theme.of(Get.context!).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(
                                Get.context!,
                              ).colorScheme.onPrimaryContainer,
                              fontSize: 18.px,
                            ),
                      ),
                      SizedBox(height: 10.px),
                      QuickActionGridView(controller: controller),
                      SizedBox(height: 16.px),
                      RecentActivityCardView(controller: controller).paddingSymmetric(horizontal: 2.px),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerView(controller: controller),
    );
  }

  Widget appBarView() {
    return Row(
      spacing: 10.px,
      children: [
        CommonWidgets.backIconBtnView(
          iconPath: IconConstantsSvg.icDrawer,
          onTap: () => controller.scaffoldKey.currentState?.openDrawer(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.welcome.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium
                    ?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(
                    Get.context!,
                  ).colorScheme.onPrimaryContainer,
                  fontSize: 14.px,
                ),
              ),
              Text(
                StringConstants.userName.tr,
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(Get.context!).colorScheme.inversePrimary,
                  fontSize: 18.px,
                  height: .8,
                ),
              ),
            ],
          ),
        ),
        CommonWidgets.backIconBtnView(
          iconPath: IconConstantsSvg.icNotification,
          // onTap: controller.clickOnChangeLanguage,
          onTap: () => Get.toNamed(Routes.NOTIFICATION),
        ),
      ],
    );
  }

}
