import 'package:flutter/material.dart';

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
        toolbarHeight: 96,
        backgroundColor: const Color.fromRGBO(49, 102, 176, 1),
        centerTitle: true,
        title: Text(
          name.capitalize(),
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(255, 204, 1, 1),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              spriteUrl,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text("Name: ${name.capitalize()}"),
            Text("#$id"),
            Text("Types: ${types.join(", ").capitalize()}"),
          ],
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