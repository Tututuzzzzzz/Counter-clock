/// App-wide constants
class AppConstants {
  // App info
  static const String appTitle = 'Countdown Clock App';
  
  // Default values
  static const int defaultCountdownSeconds = 60;
  static const int minCountdownSeconds = 1;
  static const int maxCountdownSeconds = 3600; // 1 hour
  
  // Timing
  static const Duration initializationDelay = Duration(seconds: 2);
  static const Duration timerInterval = Duration(seconds: 1);
  
  // Thresholds for color changes
  static const int warningThreshold = 30; // Orange color
  static const int criticalThreshold = 10; // Red color
  
  // UI Strings
  static const String loadingMessage = 'Đang khởi tạo ứng dụng...';
  static const String errorPrefix = 'Lỗi: ';
  static const String retryButtonText = 'Thử lại';
  static const String completionTitle = 'Hết giờ!';
  static const String completionMessage = 'Đồng hồ đếm ngược đã hoàn thành.';
  static const String okButtonText = 'OK';
  static const String startButtonText = 'Bắt đầu';
  static const String pauseButtonText = 'Tạm dừng';
  static const String resetButtonText = 'Đặt lại';
  static const String inputLabel = 'Số giây: ';
  static const String timerTitle = 'COUNTDOWN TIMER';
  
  // Error messages
  static const String serverConnectionError = 'Không thể kết nối đến server';
  static const String unknownError = 'Đã xảy ra lỗi không xác định';
  
  AppConstants._();
}
