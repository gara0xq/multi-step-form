import 'package:flutter/material.dart';
import 'package:multi_step_form/utils/colors.dart';

// ignore: must_be_immutable
class StepBox extends StatelessWidget {
  Color backgroundColor;
  Color numberColor;
  String stepNumber;
  String stepName;
  bool hasDetails;
  StepBox({
    super.key,
    required this.backgroundColor,
    required this.numberColor,
    required this.stepNumber,
    this.stepName = "",
    this.hasDetails = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: hasDetails ? double.infinity : 70,
      child: hasDetails
          ? Row(
              mainAxisAlignment: hasDetails
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: white,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      stepNumber,
                      style: TextStyle(
                        fontSize: 20,
                        color: numberColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "STEP $stepNumber",
                      style: TextStyle(
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      stepName,
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          : Container(
              margin: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: white,
                ),
              ),
              child: Center(
                child: Text(
                  stepNumber,
                  style: TextStyle(
                    fontSize: 20,
                    color: numberColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }
}
