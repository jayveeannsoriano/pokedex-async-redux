import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/model/model.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<PokemonDetails> getPokemonDetails({required String name}) async {
    final uri = baseUri.replace(path: '${baseUri.path}/pokemon/$name');
    return await apiClient.dio.getUri(uri).then((response) => PokemonDetails.fromJson(response.data));
  }
}
