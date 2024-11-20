import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/utils/colors.dart';
import 'package:multi_step_form/view/widgets/step_box.dart';

// ignore: must_be_immutable
class WindowsSide extends StatelessWidget {
  AppController controller;
  double width;
  WindowsSide({
    super.key,
    required this.controller,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: SvgPicture.asset(
            "assets/images/bg-sidebar-desktop.svg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(width / 48),
            child: width >= 767
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        StepBox(
                          backgroundColor: controller.currentIndex == 0
                              ? lightBlue
                              : Colors.transparent,
                          numberColor:
                              controller.currentIndex == 0 ? marineBlue : white,
                          stepNumber: "1",
                          stepName: "YOUR INFO",
                          hasDetails: width >= 1300 ? true : false,
                        ),
                        const SizedBox(height: 20),
                        StepBox(
                          backgroundColor: controller.currentIndex == 1
                              ? lightBlue
                              : Colors.transparent,
                          numberColor:
                              controller.currentIndex == 1 ? marineBlue : white,
                          stepNumber: "2",
                          stepName: "SELECT PLAN",
                          hasDetails: width >= 1300 ? true : false,
                        ),
                        const SizedBox(height: 20),
                        StepBox(
                          backgroundColor: controller.currentIndex == 2
                              ? lightBlue
                              : Colors.transparent,
                          numberColor:
                              controller.currentIndex == 2 ? marineBlue : white,
                          stepNumber: "3",
                          stepName: "ADD-ONS",
                          hasDetails: width >= 1300 ? true : false,
                        ),
                        const SizedBox(height: 20),
                        StepBox(
                          backgroundColor: controller.currentIndex == 3
                              ? lightBlue
                              : Colors.transparent,
                          numberColor:
                              controller.currentIndex == 3 ? marineBlue : white,
                          stepNumber: "4",
                          stepName: "SUMMARY",
                          hasDetails: width >= 1300 ? true : false,
                        ),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      StepBox(
                        backgroundColor: controller.currentIndex == 0
                            ? lightBlue
                            : Colors.transparent,
                        numberColor:
                            controller.currentIndex == 0 ? marineBlue : white,
                        stepNumber: "1",
                      ),
                      const SizedBox(width: 20),
                      StepBox(
                        backgroundColor: controller.currentIndex == 1
                            ? lightBlue
                            : Colors.transparent,
                        numberColor:
                            controller.currentIndex == 1 ? marineBlue : white,
                        stepNumber: "2",
                      ),
                      const SizedBox(width: 20),
                      StepBox(
                        backgroundColor: controller.currentIndex == 2
                            ? lightBlue
                            : Colors.transparent,
                        numberColor:
                            controller.currentIndex == 2 ? marineBlue : white,
                        stepNumber: "3",
                      ),
                      const SizedBox(width: 20),
                      StepBox(
                        backgroundColor: controller.currentIndex == 3
                            ? lightBlue
                            : Colors.transparent,
                        numberColor:
                            controller.currentIndex == 3 ? marineBlue : white,
                        stepNumber: "4",
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
