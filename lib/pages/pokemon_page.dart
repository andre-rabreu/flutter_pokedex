import 'package:flutter/material.dart';
import 'package:flutter_pokedex/breakpoints.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonPage extends StatelessWidget {
  final String name;
  final String id;
  final String spriteUrl;
  final List<String> types;

  const PokemonPage({
    super.key,
    required this.name,
    required this.id,
    required this.spriteUrl,
    required this.types
  });

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.width > breakpointMobile ? 96 : 72,
        backgroundColor: const Color.fromRGBO(49, 102, 176, 1),
        centerTitle: true,
        title: Text(
          name.capitalize(),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > breakpointMobile ? 64 : 48,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(255, 204, 1, 1),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: breakpointMobile,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          spriteUrl,
                          width: 300,
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                        Text(name.capitalize(),
                          style: const TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text("#$id",
                          style: const TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text("Types: ${types.join(", ").capitalize()}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 204, 1, 1),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

List<Widget> buildTypes(List<String> types){
  return types.map((type) => Text(type)).toList();
}