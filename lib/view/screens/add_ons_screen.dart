import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/controller/add_ons_controller.dart';
import 'package:multi_step_form/view/widgets/add-ons_box.dart';
import '../../utils/colors.dart';

class AddOnsScreen extends StatelessWidget {
  const AddOnsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GetBuilder<AddOnsController>(
          init: AddOnsController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      const Text(
                        "Pick add-ons",
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Add-ons help enhance your gaming experience.",
                        style: TextStyle(
                          fontSize: 17,
                          color: coolGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      AddOnsBox(
                        title: "Online service",
                        description: "Access to multiplayer games",
                        monthlyPrice: 1,
                        yearlyPrice: 10,
                        isYearly: controller.isYearly!,
                        index: 0,
                        isSelected: controller.addons[0].isSelected,
                        controller: controller,
                      ),
                      AddOnsBox(
                        title: "Larger storage",
                        description: "Extra 1TB of cloud save",
                        monthlyPrice: 2,
                        yearlyPrice: 20,
                        isYearly: controller.isYearly!,
                        index: 1,
                        isSelected: controller.addons[1].isSelected,
                        controller: controller,
                      ),
                      AddOnsBox(
                        title: "Customizable profile",
                        description: "Custom theme on your profile",
                        monthlyPrice: 2,
                        yearlyPrice: 20,
                        isYearly: controller.isYearly!,
                        index: 2,
                        isSelected: controller.addons[2].isSelected,
                        controller: controller,
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
                      TextButton(
                        onPressed: () {
                          controller.previousWindow();
                          controller.setAddonData();
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
                      Padding(
                        padding: EdgeInsets.only(right: width / 30),
                        child: TextButton(
                          onPressed: () {
                            controller.nextWindow();
                            controller.setAddonData();
                          },
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          child: Container(
                            height: 40,
                            width: 110,
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
          }),
    );
  }
}
