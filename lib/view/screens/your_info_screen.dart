import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/controller/app_controller.dart';
import 'package:multi_step_form/controller/your_info_controller.dart';
import 'package:multi_step_form/utils/colors.dart';

// ignore: must_be_immutable
class YourInfoScreen extends StatelessWidget {
  YourInfoScreen({
    super.key,
  });

  final _key = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNum = TextEditingController();
  final mainController = Get.find<AppController>();
  final controller = Get.put(YourInfoController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    _name.text = mainController.user!.name;
    _email.text = mainController.user!.email;
    _phoneNum.text = mainController.user!.number;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          width < 767 ? const SizedBox(height: 120) : const SizedBox(),
          Container(
            padding: width > 767
                ? EdgeInsets.symmetric(
                    horizontal: width / 24, vertical: width / 48)
                : const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Personal info",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Please provide your name, email address, and phone number.",
                      style: TextStyle(
                        fontSize: 17,
                        color: coolGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 14,
                            color: marineBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                        child: TextFormField(
                          controller: _name,
                          validator: (value) =>
                              controller.nameValidation(value!),
                          decoration: InputDecoration(
                            hintText: "e.g.Stephen King",
                            hintStyle: TextStyle(color: coolGray),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 14,
                            color: marineBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) =>
                              controller.emailValidation(value!),
                          decoration: InputDecoration(
                            hintText: "e.g.stephenking@lorem.com",
                            hintStyle: TextStyle(color: coolGray),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 14,
                            color: marineBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                        child: TextFormField(
                          controller: _phoneNum,
                          validator: (value) =>
                              controller.phoneNumberValidation(value!),
                          decoration: InputDecoration(
                            hintText: "e.g. +1 234 567 890",
                            hintStyle: TextStyle(color: coolGray),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: width / 30),
            child: TextButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  mainController.nextWindow();
                  controller.setUserData(
                    _name.text,
                    _email.text,
                    _phoneNum.text,
                  );
                }
              },
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              child: Container(
                height: 40,
                width: 110,
                margin: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: marineBlue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  "Next Step",
                  style: TextStyle(
                    fontSize: 14,
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
