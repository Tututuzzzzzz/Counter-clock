import 'package:flutter/material.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/time_formatter.dart';
import '../../../core/utils/color_helper.dart';

/// Widget to display countdown timer
class TimerDisplay extends StatelessWidget {
  final int seconds;
  
  const TimerDisplay({
    super.key,
    required this.seconds,
  });
  
  @override
  Widget build(BuildContext context) {
    final timeString = TimeFormatter.formatTime(seconds);
    final timeColor = ColorHelper.getColorForSeconds(seconds);
    
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: timeColor.withOpacity(0.1),
        border: Border.all(color: timeColor, width: 3),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: timeColor.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        timeString,
        style: AppTextStyles.timerDisplay(timeColor),
      ),
    );
  }
}
