import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/themes/text_styles.dart';
import '../../providers/countdown_provider.dart';
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
  
  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController(
      text: AppConstants.defaultCountdownSeconds.toString(),
    );
  }
  
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
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
    final provider = context.read<CountdownProvider>();
    final seconds = int.tryParse(_inputController.text) ?? 
        AppConstants.defaultCountdownSeconds;
    provider.startCountdown(seconds);
  }
  
  void _handlePause() {
    context.read<CountdownProvider>().stopCountdown();
  }
  
  void _handleReset() {
    final provider = context.read<CountdownProvider>();
    final seconds = int.tryParse(_inputController.text) ?? 
        AppConstants.defaultCountdownSeconds;
    provider.resetCountdown(seconds);
  }
  
  @override
  Widget build(BuildContext context) {
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
          
          // Timer display with StreamBuilder
          Consumer<CountdownProvider>(
            builder: (context, provider, child) {
              return StreamBuilder<int>(
                stream: provider.countdownStream,
                initialData: provider.seconds,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      '${AppConstants.errorPrefix}${snapshot.error}',
                      style: AppTextStyles.errorMessage,
                    );
                  }
                  
                  final seconds = snapshot.data ?? provider.seconds;
                  
                  // Check if completed
                  if (seconds == 0 && provider.isRunning == false) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        _showCompletionDialog();
                      }
                    });
                  }
                  
                  return TimerDisplay(seconds: seconds);
                },
              );
            },
          ),
          
          const SizedBox(height: 40),
          
          // Input field (only shown when not running)
          Consumer<CountdownProvider>(
            builder: (context, provider, child) {
              if (!provider.isRunning) {
                return Column(
                  children: [
                    TimerInput(controller: _inputController),
                    const SizedBox(height: 20),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          
          // Control buttons
          Consumer<CountdownProvider>(
            builder: (context, provider, child) {
              return TimerControls(
                isRunning: provider.isRunning,
                onStart: _handleStart,
                onPause: _handlePause,
                onReset: _handleReset,
              );
            },
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
