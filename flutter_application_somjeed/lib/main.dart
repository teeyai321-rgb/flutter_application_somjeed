import 'package:flutter/material.dart';
import 'package:flutter_application_somjeed/views/E01PageUI.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const FlutterApplicationSomjeed());

class FlutterApplicationSomjeed extends StatelessWidget {
  const FlutterApplicationSomjeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF9810)),
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: E01PageUI(),
    );
  }
}
