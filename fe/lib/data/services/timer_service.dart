import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

/// Dịch vụ quản lý bộ đếm thời gian đếm ngược
class TimerService {
  Timer? _timer;
  StreamController<int>? _countdownController;
  
  //Nhận luồng đếm ngược
  Stream<int>? get countdownStream => _countdownController?.stream;
  
  //Khởi tạo bộ điều khiển luồng
  void initialize() {
    _countdownController ??= StreamController<int>();
  }
  
  /// Bắt đầu bộ đếm thời gian đếm ngược
  void startCountdown({
    required int initialSeconds,
    required Function(int) onTick,
    required VoidCallback onComplete,
  }) {
    // Hủy bộ đếm thời gian hiện tại nếu có
    stopCountdown();
    
    int currentSeconds = initialSeconds;
    
    // Phát giá trị ban đầu
    _countdownController?.add(currentSeconds);
    
    // Tạo bộ đếm thời gian định kỳ
    _timer = Timer.periodic(AppConstants.timerInterval, (timer) {
      currentSeconds--;
      
      if (currentSeconds >= 0) {
        _countdownController?.add(currentSeconds);
        onTick(currentSeconds);
      } else {
        stopCountdown();
        onComplete();
      }
    });
  }
  
  // Dừng bộ đếm thời gian đếm ngược
  void stopCountdown() {
    _timer?.cancel();
    _timer = null;
  }
}
