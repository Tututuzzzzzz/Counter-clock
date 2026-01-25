import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/themes/text_styles.dart';

/// Widget for timer input
class TimerInput extends StatelessWidget {
  final TextEditingController controller;
  
  const TimerInput({
    super.key,
    required this.controller,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppConstants.inputLabel,
          style: AppTextStyles.inputLabel,
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTextStyles.inputText,
          ),
        ),
      ],
    );
  }
}
