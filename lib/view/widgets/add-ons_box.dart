import 'package:flutter/material.dart';
import 'package:multi_step_form/controller/add_ons_controller.dart';
import '../../utils/colors.dart';

// ignore: must_be_immutable
class AddOnsBox extends StatelessWidget {
  String title;
  String description;
  int monthlyPrice;
  int yearlyPrice;
  bool isSelected;
  bool isYearly;
  int index;
  AddOnsController controller;
  AddOnsBox({
    super.key,
    required this.title,
    required this.description,
    required this.monthlyPrice,
    required this.yearlyPrice,
    this.isSelected = false,
    this.isYearly = false,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(width / 128),
      decoration: BoxDecoration(
        color: isSelected ? magnolia : Colors.transparent,
        border: Border.all(
          width: 1,
          color: isSelected ? marineBlue : coolGray,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
              value: isSelected,
              onChanged: (value) {
                controller.changeAddOn(index, value!);
              }),
          SizedBox(width: width / 96),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: width < 1400 ? 12 : width / 120,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: width < 1400 ? 11 : width / 137,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            isYearly ? "+\$$yearlyPrice/yr" : "+\$$monthlyPrice/mo",
            style: TextStyle(
              fontSize: width < 1400 ? 11 : width / 137,
              color: marineBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
