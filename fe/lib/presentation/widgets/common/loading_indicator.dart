import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

/// Common loading indicator widget
class LoadingIndicator extends StatelessWidget {
  final String? message;
  
  const LoadingIndicator({
    super.key,
    this.message,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 20),
            Text(
              message!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Loading indicator with default message
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
      message: AppConstants.loadingMessage,
    );
  }
}
