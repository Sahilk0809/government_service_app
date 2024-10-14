import 'package:flutter/material.dart';
import 'package:government_service_app/provider/burger_provider.dart';
import 'package:government_service_app/view/all_in_one_app/home_screen.dart';
import 'package:government_service_app/view/all_in_one_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BurgerProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
