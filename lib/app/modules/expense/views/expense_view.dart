import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/expense/screens/add_expense.dart';
import 'package:truck/app/modules/expense/screens/expense_list.dart';
import '../../../../common/background_image.dart';
import '../../../../common/cw.dart';
import '../../../../language/string_constants.dart';
import '../controllers/expense_controller.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({super.key});

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
                CommonWidgets.appBarView(title: StringConstants.expenses.tr),
                SizedBox(height: 20.px),
                Divider(
                  thickness: 1.px,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                  indent: 5.px,
                  endIndent: 5.px,
                  height: 0.px,
                ),
                tabBarView(),
                Expanded(
                  child: Obx(() {
                    return ListView(
                      children: [
                        controller.tabBarSelectedValue.value ==
                                StringConstants.addExpense.tr
                            ? AddExpense(controller: controller)
                            : ExpenseList(controller: controller),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: addBtnView(),
    );
  }

  Widget tabBarView() {
    return Obx(() {
      var list = [
        StringConstants.addExpense.tr,
        StringConstants.expensesList.tr,
      ];
      return Row(
        children: List.generate(list.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.tabBarSelectedValue.value = list[index],
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.px),
                decoration: BoxDecoration(
                  color: controller.tabBarSelectedValue.value == list[index]
                      ? Theme.of(Get.context!).primaryColor.withAlpha(10)
                      : Theme.of(Get.context!).colorScheme.onPrimary,
                  border: Border(
                    bottom: BorderSide(
                      color: controller.tabBarSelectedValue.value == list[index]
                          ? Theme.of(Get.context!).primaryColor
                          : Theme.of(
                              Get.context!,
                            ).colorScheme.surface.withAlpha(300),
                      width: controller.tabBarSelectedValue.value == list[index]
                          ? 2.px
                          : 1.px,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          controller.tabBarSelectedValue.value == list[index]
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: controller.tabBarSelectedValue.value == list[index]
                          ? Theme.of(Get.context!).primaryColor
                          : Theme.of(Get.context!).colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }

  Widget addBtnView() {
    return Obx(
          () =>
      controller.tabBarSelectedValue.value == StringConstants.addExpense.tr
          ? SizedBox()
          : FloatingActionButton(
        onPressed: () => controller.tabBarSelectedValue.value = StringConstants.addExpense.tr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.px),
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(Get.context!).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
