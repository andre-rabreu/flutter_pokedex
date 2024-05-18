import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    hintText: 'Pesquisar pokémon',
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
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      Navigator.pushNamed(context, '/pokemon',
                        arguments: {'pokemonName': value});
                    }
                  }
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                var pokemonName = textController.text;
                if (pokemonName.isNotEmpty) {
                  Navigator.pushNamed(
                    context, '/pokemon',
                    arguments: {'pokemonName': pokemonName});
                  }
                },
              child: const Text('Buscar pokémon'),
            ),
          ],
        )
      )
    );
  }
}
