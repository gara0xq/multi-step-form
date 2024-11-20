import 'package:multi_step_form/model/addon_model.dart';
import 'package:multi_step_form/model/plan_model.dart';

class Summary {
  Plan plan;
  bool isYearly;
  int price;
  List<Addon> addons;

  Summary({
    required this.plan,
    required this.isYearly,
    required this.price,
    required this.addons,
  });
}
