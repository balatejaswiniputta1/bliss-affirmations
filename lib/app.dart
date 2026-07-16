import 'package:flutter/material.dart';

import 'pages/home_shell.dart';

class BlissApp extends StatelessWidget {
  const BlissApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bliss',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B6FD6),
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.7,
          ),
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(height: 1.45),
        ),
      ),
      home: const HomeShell(),
    );
  }
}
