import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/model/plan_model.dart';

class SelectPlanController extends GetxController {
  bool _isYearly = false;
  int _selectedPlan = 0;
  List<Plan> plans = [];
  bool get isYearly => _isYearly;
  int get selectedPlan => _selectedPlan;

  final _appController = Get.find<AppController>();

  @override
  void onInit() {
    _selectedPlan = _appController.planIndex;
    _isYearly = _appController.isYearly;
    plans = _appController.plans;
    super.onInit();
  }

  setIsYearly(bool value) {
    _isYearly = value;
    update();
  }

  setPlanIndex(int planIndex) {
    _selectedPlan = planIndex;
    update();
  }
}
