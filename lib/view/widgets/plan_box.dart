import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_step_form/controller/select_plan_controller.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class PlanBox extends StatelessWidget {
  String title;
  int yearlyPrice;
  int monthlyPrice;
  bool isSelected;
  bool phone;
  SelectPlanController controller;
  int index;
  String icon;
  PlanBox({
    super.key,
    required this.title,
    this.yearlyPrice = 90,
    this.monthlyPrice = 9,
    this.isSelected = false,
    this.phone = false,
    required this.controller,
    required this.index,
    this.icon = "icon-arcade.svg",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.setPlanIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: controller.selectedPlan == index
                ? magnolia
                : Colors.transparent,
            border: Border.all(
              width: 2,
              color: controller.selectedPlan == index ? marineBlue : coolGray,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: phone
            ? Row(
                children: [
                  SvgPicture.asset("assets/icons/$icon"),
                  const SizedBox(width: 20),
                  _dataContainer(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset("assets/icons/$icon"),
                  ),
                  _dataContainer(),
                ],
              ),
      ),
    );
  }

  _dataContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          style: TextStyle(
            fontSize: 16,
            color: marineBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          controller.isYearly ? "\$$yearlyPrice/yr" : "\$$monthlyPrice/mo",
          maxLines: 1,
          style: TextStyle(
            fontSize: 14,
            color: coolGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        controller.isYearly
            ? Text(
                "2 months free",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: marineBlue,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
