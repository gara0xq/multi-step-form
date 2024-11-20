import 'dart:developer';

import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/model/addon_model.dart';

class AddOnsController extends GetxController {
  final controller = Get.find<AppController>();
  previousWindow() => controller.previousWindow();
  nextWindow() => controller.nextWindow();
  bool? isYearly;
  List<Addon> addons = [];

  @override
  void onInit() {
    isYearly = controller.isYearly;
    addons = controller.summary.addons;
    super.onInit();
  }

  changeAddOn(int index, bool value) {
    addons[index].isSelected = value;
    update();
  }

  setAddonData() {
    controller.summary.addons = addons;
  }

  @override
  void onClose() {
    log(controller.summary.addons.toString());
    super.onClose();
  }
}
