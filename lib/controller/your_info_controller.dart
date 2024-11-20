import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/model/user_model.dart';

class YourInfoController extends GetxController {
  final controller = Get.find<AppController>();

  nameValidation(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
  }

  emailValidation(String value) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (value.isEmpty) {
      return "This field is required";
    }
    if (!emailRegex.hasMatch(value)) {
      return "This email not valid";
    }
  }

  phoneNumberValidation(String value) {
    final emailRegex = RegExp(r'^\+?[0-9]{10,15}$');

    if (value.isEmpty) {
      return "This field is required";
    }
    if (!emailRegex.hasMatch(value)) {
      return "This email not valid";
    }
  }

  setUserData(String name, String email, String number) {
    controller.user = User(name: name, email: email, number: number);
  }
}
