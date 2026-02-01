import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/themes/text_styles.dart';
import '../../../data/services/timer_service.dart';
import '../../widgets/countdown/timer_display.dart';
import '../../widgets/countdown/timer_controls.dart';
import '../../widgets/countdown/timer_input.dart';

/// Main countdown screen
class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  late TextEditingController _inputController;
  late TimerService _timerService;
  int _seconds = AppConstants.defaultCountdownSeconds;
  bool _isRunning = false;
  
  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController(
      text: AppConstants.defaultCountdownSeconds.toString(),
    );
    _timerService = TimerService();
    _timerService.initialize();
  }
  
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppConstants.completionTitle),
        content: const Text(AppConstants.completionMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleReset();
            },
            child: const Text(AppConstants.okButtonText),
          ),
        ],
      ),
    );
  }
  
  void _handleStart() {
    if (_isRunning) return;
    
    final seconds = int.tryParse(_inputController.text) ??
        AppConstants.defaultCountdownSeconds;
    
    setState(() {
      _seconds = seconds;
      _isRunning = true;
    });
    
    _timerService.startCountdown(
      initialSeconds: seconds,
      onTick: (seconds) {
        setState(() {
          _seconds = seconds;
        });
      },
      onComplete: () {
        setState(() {
          _seconds = 0;
          _isRunning = false;
        });
      },
    );
  }
  
  void _handlePause() {
    _timerService.stopCountdown();
    setState(() {
      _isRunning = false;
    });
  }
  
  void _handleReset() {
    _timerService.stopCountdown();
    final seconds = int.tryParse(_inputController.text) ?? 
        AppConstants.defaultCountdownSeconds;
    setState(() {
      _seconds = seconds;
      _isRunning = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Kiểm tra nếu đã hoàn thành
    if (_seconds == 0 && !_isRunning) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showCompletionDialog();
        }
      });
    }
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          const Text(
            AppConstants.timerTitle,
            style: AppTextStyles.screenTitle,
          ),
          const SizedBox(height: 40),
  
          
          // Hiển thị bộ đếm thời gian
          TimerDisplay(seconds: _seconds),
          
          const SizedBox(height: 40),
          
          // Trường nhập liệu (chỉ hiển thị khi không chạy)
          if (!_isRunning)
            Column(
              children: [
                TimerInput(controller: _inputController),
                const SizedBox(height: 20),
              ],
            ),
          
          // Control buttons
          TimerControls(
            isRunning: _isRunning,
            onStart: _handleStart,
            onPause: _handlePause,
            onReset: _handleReset,
          ),
        ],
      ),
    );
  }
}
