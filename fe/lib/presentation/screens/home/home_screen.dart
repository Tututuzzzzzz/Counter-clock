import 'package:flutter/material.dart';
import '../../../data/services/initialization_service.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_view.dart';
import '../countdown/countdown_screen.dart';

/// Home screen with initialization logic
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String> _initializationFuture;
  final InitializationService _initService = InitializationService();
  
  @override
  void initState() {
    super.initState();
    _initializationFuture = _initService.initializeApp();
  }
  
  void _retry() {
    setState(() {
      _initializationFuture = _initService.initializeApp();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Đồng Hồ Đếm Ngược'),
      ),
      body: FutureBuilder<String>(
        future: _initializationFuture,
        builder: (context, snapshot) {
          // Handle different states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoadingIndicator();
          } else if (snapshot.hasError) {
            return ErrorView(
              errorMessage: snapshot.error.toString(),
              onRetry: _retry,
            );
          } else {
            return const CountdownScreen();
          }
        },
      ),
    );
  }
}
