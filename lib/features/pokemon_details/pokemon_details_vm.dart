import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details.dart';
import 'package:pokedex_async_redux/state/state.dart';
import 'package:pokedex_async_redux/utils/utils.dart';
import 'package:async_redux/async_redux.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm fromStore() => PokemonDetailsVm(pokemonDetails: _pokemonDetails());

  Async<PokemonDetails> _pokemonDetails() {
    if (state.wait.isWaitingFor(GetPokemonDetailsAction.key)) return const Async.loading();

    if (state.pokemonDetails == null) return const Async.error(errorMessage);

    return Async(state.pokemonDetails!);
  }
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({
    required this.pokemonDetails,
  }) : super(equals: [pokemonDetails]);

  final Async<PokemonDetails> pokemonDetails;
}
