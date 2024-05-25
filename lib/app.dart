import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedéx",
      home: const HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.pixelifySansTextTheme(),
      ),
      routes: {
        "/home": (context) => const HomePage(),
      },
    );
  }
}
