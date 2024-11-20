import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/utils/colors.dart';
import 'package:multi_step_form/view/widgets/step_box.dart';

// ignore: must_be_immutable
class PhoneSide extends StatelessWidget {
  AppController controller;
  PhoneSide({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/bg-sidebar-mobile.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepBox(
                      backgroundColor: controller.currentIndex == 0
                          ? lightBlue
                          : Colors.transparent,
                      numberColor:
                          controller.currentIndex == 0 ? marineBlue : white,
                      stepNumber: "1",
                      hasDetails: false,
                    ),
                    StepBox(
                      backgroundColor: controller.currentIndex == 1
                          ? lightBlue
                          : Colors.transparent,
                      numberColor:
                          controller.currentIndex == 1 ? marineBlue : white,
                      stepNumber: "2",
                      hasDetails: false,
                    ),
                    StepBox(
                      backgroundColor: controller.currentIndex == 2
                          ? lightBlue
                          : Colors.transparent,
                      numberColor:
                          controller.currentIndex == 2 ? marineBlue : white,
                      stepNumber: "3",
                      hasDetails: false,
                    ),
                    StepBox(
                      backgroundColor: controller.currentIndex == 3
                          ? lightBlue
                          : Colors.transparent,
                      numberColor:
                          controller.currentIndex == 3 ? marineBlue : white,
                      stepNumber: "4",
                      hasDetails: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
