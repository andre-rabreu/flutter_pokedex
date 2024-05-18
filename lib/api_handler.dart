import 'package:dio/dio.dart';

final dio = Dio();

void getPokemon() async {
  try {
    var response = await dio.get('https://pokeapi.co/api/v2/pokemon/pikachuu');
    print(response.data['name']);
  } catch (e) {
    print("ERROR 404");
  }
}
