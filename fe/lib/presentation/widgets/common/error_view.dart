import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_constants.dart';

/// Common error view widget
class ErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;
  
  const ErrorView({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: ColorConstants.errorIconColor,
            size: 60,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${AppConstants.errorPrefix}$errorMessage',
              style: const TextStyle(
                fontSize: 16,
                color: ColorConstants.errorColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text(AppConstants.retryButtonText),
            ),
          ],
        ],
      ),
    );
  }
}
