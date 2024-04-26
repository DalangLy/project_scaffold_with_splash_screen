import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final ThemeMode themeMode;

  const SplashScreen({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Text("Splash Screen"),
                Spacer(),
                Text("Version 1.0.0"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
