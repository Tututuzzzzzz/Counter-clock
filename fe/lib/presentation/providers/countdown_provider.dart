import 'package:flutter/material.dart';
import '../../data/models/countdown_model.dart';
import '../../data/services/timer_service.dart';
import '../../core/constants/app_constants.dart';

/// Nhà cung cấp dịch vụ quản lý trạng thái đếm ngược
class CountdownProvider extends ChangeNotifier {
  final TimerService _timerService;
  
  CountdownModel _countdownModel = CountdownModel.initial(
    AppConstants.defaultCountdownSeconds,
  );
  
  CountdownProvider({TimerService? timerService})
      : _timerService = timerService ?? TimerService() {
    _timerService.initialize();
  }
  
  // Getters
  CountdownModel get countdownModel => _countdownModel;
  int get seconds => _countdownModel.seconds;
  bool get isRunning => _countdownModel.isRunning;
  Stream<int>? get countdownStream => _timerService.countdownStream;
  
  /// Start the countdown
  void startCountdown(int initialSeconds) {
    if (_countdownModel.isRunning) return;
    
    _countdownModel = _countdownModel.copyWith(
      seconds: initialSeconds,
      isRunning: true,
    );
    notifyListeners();
    
    _timerService.startCountdown(
      initialSeconds: initialSeconds,
      onTick: (seconds) {
        _countdownModel = _countdownModel.copyWith(seconds: seconds);
        // No need to notify listeners here as StreamBuilder handles UI updates
      },
      onComplete: () {
        _countdownModel = _countdownModel.copyWith(
          seconds: 0,
          isRunning: false,
        );
        notifyListeners();
      },
    );
  }
  
  /// Stop the countdown
  void stopCountdown() {
    _timerService.stopCountdown();
    _countdownModel = _countdownModel.copyWith(isRunning: false);
    notifyListeners();
  }
  
  /// Reset the countdown
  void resetCountdown(int initialSeconds) {
    stopCountdown();
    _countdownModel = _countdownModel.copyWith(seconds: initialSeconds);
    _timerService.emitValue(initialSeconds);
    notifyListeners();
  }
  
  @override
  void dispose() {
    _timerService.dispose();
    super.dispose();
  }
}
