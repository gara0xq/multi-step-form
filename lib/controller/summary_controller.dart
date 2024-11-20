import 'dart:developer';

import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/model/addon_model.dart';

class SummaryController extends GetxController {
  final controller = Get.find<AppController>();
  previousWindow() => controller.previousWindow();
  nextWindow() => controller.nextWindow();

  bool isYearly = false;
  List<Addon> addons = [];

  @override
  void onInit() {
    for (Addon i in controller.summary.addons) {
      if (i.isSelected) {
        addons.add(i);
      }
    }

    isYearly = controller.isYearly;
    controller.calcPrice();

    log(addons.length.toString());

    super.onInit();
  }
}
