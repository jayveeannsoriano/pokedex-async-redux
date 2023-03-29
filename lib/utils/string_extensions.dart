import 'package:pokedex_async_redux/utils/constants.dart';

extension StringExtension on String {
  String get pokemonId => split(urlSplitter)[idIndex];
  String get toPokemonImageUrl => pokemonImageUrlPath.replaceAll(indexKey, pokemonId);
}
