import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final pokemonName = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{"title": ""}) as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        backgroundColor: const Color.fromRGBO(49, 102, 176, 1),
        centerTitle: true,
        title: Text(
          pokemonName['pokemonName'].toString().capitalize(),
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
            // Image.network(
            //   dio.get('https://pokeapi.co/api/v2/pokemon/pikachu').data['sprites']['front_default'],
            //   // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonName['pokemonId']}.png',
            //   width: 200,
            //   height: 200,
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
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