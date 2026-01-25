/// Model for countdown data
class CountdownModel {
  final int seconds;
  final bool isRunning;
  
  const CountdownModel({
    required this.seconds,
    required this.isRunning,
  });
  
  /// Create initial countdown model
  factory CountdownModel.initial(int seconds) {
    return CountdownModel(
      seconds: seconds,
      isRunning: false,
    );
  }
  
  /// Copy with method for immutability
  CountdownModel copyWith({
    int? seconds,
    bool? isRunning,
  }) {
    return CountdownModel(
      seconds: seconds ?? this.seconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }
  
  /// Check if countdown is completed
  bool get isCompleted => seconds <= 0;
  
  /// Check if countdown can start
  bool get canStart => !isRunning && seconds > 0;
  
  @override
  String toString() => 'CountdownModel(seconds: $seconds, isRunning: $isRunning)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CountdownModel &&
        other.seconds == seconds &&
        other.isRunning == isRunning;
  }
  
  @override
  int get hashCode => seconds.hashCode ^ isRunning.hashCode;
}
