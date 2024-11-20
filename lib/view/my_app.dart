import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/view/screens/add_ons_screen.dart';
import 'package:multi_step_form/view/screens/select_plan_screen.dart';
import 'package:multi_step_form/view/screens/summary_screen.dart';
import 'package:multi_step_form/view/screens/your_info_screen.dart';
import 'package:multi_step_form/view/widgets/phone_side.dart';
import 'package:multi_step_form/view/widgets/windows_side.dart';
import '../utils/colors.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightBlue,
      body: GetBuilder<AppController>(
        builder: (c) {
          return Stack(
            children: [
              width < 767 ? PhoneSide(controller: controller) : const SizedBox(),
              Center(
                child: Container(
                  // alignment: Alignment.center,
                  padding: EdgeInsets.all(width / 96),
                  height: width > 767 ? height * 0.8 : height,
                  width: width > 767 ? width * 0.6 : width - 40,
                  decoration: BoxDecoration(
                    color: width > 767 ? white : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: width > 767
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      width > 767
                          ? Expanded(
                              flex: 2,
                              child: WindowsSide(
                                  controller: controller, width: width),
                            )
                          : const SizedBox(),
                      Expanded(
                        flex: 4,
                        child: controller.currentIndex == 0
                            ? YourInfoScreen()
                            : controller.currentIndex == 1
                                ? SelectPlanScreen()
                                : controller.currentIndex == 2
                                    ? const AddOnsScreen()
                                    : const SummaryScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
