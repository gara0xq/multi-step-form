import 'dart:developer';

import 'package:get/get.dart';
import 'package:multi_step_form/model/addon_model.dart';
import 'package:multi_step_form/model/plan_model.dart';
import 'package:multi_step_form/model/summary_model.dart';
import 'package:multi_step_form/model/user_model.dart';

class AppController extends GetxController {
  int currentIndex = 3;
  int _planIndex = 0;
  User? user;
  Summary summary = Summary(
      plan: Plan(name: "Arcade", monthlyPrice: 9, yearlyPrice: 90),
      isYearly: false,
      price: 0,
      addons: []);

  Addon addon1 = Addon(
    name: "Online service",
    description: "Access to multiplayer games",
    monthlyPrice: 1,
    yearlyPrice: 10,
    isSelected: false,
  );
  Addon addon2 = Addon(
    name: "Larger storage",
    description: "Extra 1TB of cloud save",
    monthlyPrice: 2,
    yearlyPrice: 20,
    isSelected: false,
  );
  Addon addon3 = Addon(
    name: "Customizable profile",
    description: "Custom theme on your profile",
    monthlyPrice: 2,
    yearlyPrice: 20,
    isSelected: false,
  );
  List<Plan> plans = [];
  Plan arcade = Plan(name: "Arcade", monthlyPrice: 9, yearlyPrice: 90);
  Plan advanced = Plan(name: "Advanced", monthlyPrice: 12, yearlyPrice: 120);
  Plan pro = Plan(name: "Pro", monthlyPrice: 15, yearlyPrice: 150);

  @override
  void onInit() {
    summary.addons = [addon1, addon2, addon3];
    plans = [arcade, advanced, pro];
    super.onInit();
  }

  bool get isYearly => summary.isYearly;
  int get planIndex => _planIndex;

  nextWindow() {
    currentIndex++;
    update();
  }

  previousWindow() {
    currentIndex--;
    update();
  }

  setPlanData(bool isYearly, int planIndex) {
    summary.isYearly = isYearly;
    summary.plan = plans[planIndex];
    log(summary.plan.name.toString());
    summary.isYearly = isYearly;
  }

  calcPrice() {
    summary.price = 0;
    if (summary.isYearly) {
      for (Addon i in summary.addons) {
        if (i.isSelected) {
          summary.price += i.yearlyPrice;
        }
      }
      summary.price += summary.plan.yearlyPrice;
    } else {
      for (Addon i in summary.addons) {
        if (i.isSelected) {
          summary.price += i.yearlyPrice;
        }
      }
      summary.price += summary.plan.monthlyPrice;
    }
  }
}
