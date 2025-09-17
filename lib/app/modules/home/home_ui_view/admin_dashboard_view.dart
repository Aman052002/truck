import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../language/string_constants.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 900 ? 3 : 6;
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            dashboardCard(
              context,
              icon: Icons.payments_outlined,
              title: StringConstants.totalPayments.tr,
              value: "₹2,45,000",
            ),
            dashboardCard(
              context,
              icon: Icons.local_shipping_outlined,
              title: StringConstants.totalTrucks.tr,
              value: "35",
            ),
            dashboardCard(
              context,
              icon: Icons.person_pin_circle,
              title: StringConstants.total.tr,
              value: "50",
            ),
            dashboardCard(
              context,
              icon: Icons.directions_run_outlined,
              title: StringConstants.activeTrips.tr,
              value: "12",
            ),
            dashboardCard(
              context,
              icon: Icons.done_all_outlined,
              title: StringConstants.completedTrips.tr,
              value: "528",
            ),
          ],
        );
      },
    );
  }

  Widget dashboardCard(BuildContext context,
      {required IconData icon, required String title, required String value}) {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 32, color: Theme.of(context).colorScheme.primary),
          SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
