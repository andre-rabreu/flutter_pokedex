import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'pokemon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        backgroundColor: const Color.fromRGBO(49, 102, 176, 1),
        centerTitle: true,
        title: const Text(
          'Pokédex',
          style: TextStyle(
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
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 64,
              color: Colors.grey[200],
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 24,
                    ),
                    hintText: 'Search pokémon',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  controller: textController,
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      try {
                        final response = await dio.get(
                            'https://pokeapi.co/api/v2/pokemon/${value.toLowerCase()}'
                        );
                        List<String> types = [];
                        for(var type in response.data['types']){
                          types.add(type['type']['name']);
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PokemonPage(
                              name: response.data['name'],
                              id: response.data['id'].toString(),
                              spriteUrl: response.data['sprites']['front_default'],
                              types: types,
                            ),
                          )
                        );
                      } on DioException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Pokémon not found. Error status: ${e.response?.statusCode}'),
                              backgroundColor: Colors.red,
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                },
                              )
                          )
                        );
                      }
                    }
                  }
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                var value = textController.text;
                if (value.isNotEmpty) {
                  try {
                    final response = await dio.get(
                        'https://pokeapi.co/api/v2/pokemon/${value.toLowerCase()}'
                    );
                    List<String> types = [];
                    for(var type in response.data['types']){
                      types.add(type['type']['name']);
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PokemonPage(
                          name: response.data['name'],
                          id: response.data['id'].toString(),
                          spriteUrl: response.data['sprites']['front_default'],
                          types: types,
                        ),
                      )
                    );
                  } on DioException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Pokémon not found. Error status: ${e.response?.statusCode}'),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        )
                      )
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 204, 1, 1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Find pokémon',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  )
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
