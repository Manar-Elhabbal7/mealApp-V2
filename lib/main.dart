import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MealApp()));
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title :"Meal App",
      theme :ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple
        ),
      ),
      home : Tabs(
      ),
    );
  }
}
