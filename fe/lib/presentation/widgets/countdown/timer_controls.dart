import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_constants.dart';

/// Widget for timer control buttons
class TimerControls extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onReset;
  
  const TimerControls({
    super.key,
    required this.isRunning,
    required this.onStart,
    required this.onPause,
    required this.onReset,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Start/Pause button
        ElevatedButton.icon(
          onPressed: isRunning ? onPause : onStart,
          icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
          label: Text(
            isRunning 
                ? AppConstants.pauseButtonText 
                : AppConstants.startButtonText,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: isRunning 
                ? ColorConstants.pauseButtonColor 
                : ColorConstants.startButtonColor,
            foregroundColor: ColorConstants.buttonTextColor,
          ),
        ),
        
        const SizedBox(width: 20),
        
        // Reset button
        ElevatedButton.icon(
          onPressed: onReset,
          icon: const Icon(Icons.refresh),
          label: const Text(AppConstants.resetButtonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.resetButtonColor,
            foregroundColor: ColorConstants.buttonTextColor,
          ),
        ),
      ],
    );
  }
}
