import 'package:blur/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark().copyWith(
          surface: Color(0xFFdacbb6),
          primary: Color(0xFF5e7381),
          surfaceContainer: Color(0xFFeaC686),
          onSurface: Color(0xFF010100),
        ),
        textTheme: GoogleFonts.cascadiaMonoTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
