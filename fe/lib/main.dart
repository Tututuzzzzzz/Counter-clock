import 'package:flutter/material.dart';  
import 'core/constants/app_constants.dart';  
import 'core/themes/app_theme.dart';  
import 'presentation/screens/home/home_screen.dart';  
  
void main() {  
  runApp(const MyApp());  
}  

class MyApp extends StatelessWidget {  
  const MyApp({super.key});  
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: AppConstants.appTitle,  
      theme: AppTheme.lightTheme,  
      home: const HomeScreen(),  
      debugShowCheckedModeBanner: false,  
    );
  }
}
