import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/controller/select_plan_controller.dart';
import 'package:multi_step_form/utils/colors.dart';
import 'package:multi_step_form/view/widgets/plan_box.dart';

// ignore: must_be_immutable
class SelectPlanScreen extends StatelessWidget {
  SelectPlanScreen({super.key});
  AppController mainController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Builder(
        builder: (context) {
          return GetBuilder<SelectPlanController>(
            init: SelectPlanController(),
            builder: (controller) {
              return Column(
                children: [
                  width < 767 ? const SizedBox(height: 110) : const SizedBox(),
                  Container(
                    margin: width > 900
                        ? EdgeInsets.symmetric(horizontal: width / 60)
                        : const EdgeInsets.symmetric(horizontal: 0),
                    padding: width > 767
                        ? EdgeInsets.symmetric(
                            horizontal: width / 24, vertical: width / 48)
                        : const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Select your plan",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "You have the option of monthly or yearly billing.",
                              style: TextStyle(
                                fontSize: 17,
                                color: coolGray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: width < 767 ? 20 : 60),
                        SizedBox(
                          child: width < 767
                              ? Column(
                                  children: [
                                    PlanBox(
                                      title: controller.plans[0].name,
                                      monthlyPrice:
                                          controller.plans[0].monthlyPrice,
                                      yearlyPrice:
                                          controller.plans[0].yearlyPrice,
                                      phone: true,
                                      controller: controller,
                                      index: 0,
                                    ),
                                    const SizedBox(height: 20),
                                    PlanBox(
                                      title: controller.plans[1].name,
                                      monthlyPrice:
                                          controller.plans[1].monthlyPrice,
                                      yearlyPrice:
                                          controller.plans[1].yearlyPrice,
                                      controller: controller,
                                      index: 1,
                                      phone: true,
                                      icon: "icon-advanced.svg",
                                    ),
                                    const SizedBox(height: 20),
                                    PlanBox(
                                      title: controller.plans[2].name,
                                      monthlyPrice:
                                          controller.plans[2].monthlyPrice,
                                      yearlyPrice:
                                          controller.plans[2].yearlyPrice,
                                      controller: controller,
                                      index: 2,
                                      phone: true,
                                      icon: "icon-pro.svg",
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: PlanBox(
                                        title: controller.plans[0].name,
                                        monthlyPrice:
                                            controller.plans[0].monthlyPrice,
                                        yearlyPrice:
                                            controller.plans[0].yearlyPrice,
                                        controller: controller,
                                        index: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: PlanBox(
                                        title: controller.plans[1].name,
                                        monthlyPrice:
                                            controller.plans[1].monthlyPrice,
                                        yearlyPrice:
                                            controller.plans[1].yearlyPrice,
                                        controller: controller,
                                        index: 1,
                                        icon: "icon-advanced.svg",
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: PlanBox(
                                        title: controller.plans[2].name,
                                        monthlyPrice:
                                            controller.plans[2].monthlyPrice,
                                        yearlyPrice:
                                            controller.plans[2].yearlyPrice,
                                        controller: controller,
                                        index: 2,
                                        icon: "icon-pro.svg",
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: magnolia,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Monthly",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: controller.isYearly
                                      ? coolGray
                                      : marineBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Switch(
                                value: controller.isYearly,
                                onChanged: (newVal) {
                                  controller.setIsYearly(newVal);
                                },
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Yearly",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: controller.isYearly
                                      ? marineBlue
                                      : coolGray,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: width > 767
                        ? EdgeInsets.only(left: width / 24)
                        : const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              mainController.previousWindow();
                              mainController.setPlanData(
                                  controller.isYearly, controller.selectedPlan);
                            },
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            child: Text(
                              "Go Back",
                              style: TextStyle(
                                fontSize: 16,
                                color: marineBlue,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: TextButton(
                            onPressed: () {
                              mainController.nextWindow();
                              mainController.setPlanData(
                                  controller.isYearly, controller.selectedPlan);
                            },
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            child: Container(
                              height: 40,
                              width: 110,
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: marineBlue,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "Next Step",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
