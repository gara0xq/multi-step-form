import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/controller/summary_controller.dart';
import '../../utils/colors.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  Color buttonColor = marineBlue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GetBuilder<SummaryController>(
          init: SummaryController(),
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
                        "Finnishing up",
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Double-check everthing looks OK before confiming.",
                        style: TextStyle(
                          fontSize: 17,
                          color: coolGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: magnolia,
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.controller.summary.plan.name}(${controller.isYearly ? "Yearly" : "Monthly"})",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: marineBlue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    InkWell(
                                      onHover: (x) {
                                        setState(() {
                                          if (x) {
                                            buttonColor = coolGray;
                                          } else {
                                            buttonColor = marineBlue;
                                          }
                                        });
                                      },
                                      onTap: () {
                                        controller.controller.currentIndex = 1;
                                        controller.update();
                                      },
                                      child: Text(
                                        "Change",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: buttonColor,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  controller.isYearly
                                      ? "\$${controller.controller.summary.plan.yearlyPrice}/yr"
                                      : "\$${controller.controller.summary.plan.monthlyPrice}/mo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: marineBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: controller.addons.isEmpty
                                  ? 40
                                  : controller.addons.length * 30,
                              width: double.infinity,
                              child: controller.addons.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Add-ons",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: marineBlue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.addons.length,
                                      itemBuilder: (_, i) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                controller.addons[i].name,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: coolGray,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                controller.isYearly
                                                    ? "+\$${controller.addons[i].yearlyPrice}/yr"
                                                    : "+\$${controller.addons[i].monthlyPrice}/mo",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: marineBlue,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      )
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
                            controller.previousWindow();
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
                        padding: EdgeInsets.symmetric(horizontal: width / 30),
                        child: TextButton(
                          onPressed: () {
                            controller.nextWindow();
                          },
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          child: Container(
                            height: 60,
                            width: 130,
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: marineBlue,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 16,
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
