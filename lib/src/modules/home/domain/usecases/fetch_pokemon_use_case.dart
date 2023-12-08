import '../entities/pokemon_info_entity.dart';
import '../entities/pokemon_list_entity.dart';

import '../repository/home_repository.dart';

class FetchPokemonUseCase {
  final HomeRepository _homeRepository;

  FetchPokemonUseCase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<PokemonBasicEntity?> fetchPokemonsList() async {
    return _homeRepository.fetchPokemonsList();
  }

  Future<PokemonInfoEntity?> fetchPokemonInfo({required String pokemonName}) async {
    return _homeRepository.fetchPokemonInfo(pokemonName: pokemonName);
  }

  Future<PokemonBasicEntity?> fetchPokemonByUrl({required String url}) async {
    return _homeRepository.fetchPokemonByUrl(url: url);
  }

  Future<List<PokemonInfoEntity>> fetchAllPokemonsOnScreen() async {
    List<PokemonInfoEntity> fetchedPokemonList = [];
    final pokemonBasic = await fetchPokemonsList();
    for (PokemonResultsEntity pokemon in pokemonBasic!.results!) {
      final pokemonInfo = await fetchPokemonInfo(pokemonName: pokemon.name!);
      if (pokemonInfo.runtimeType == PokemonInfoEntity) {
        fetchedPokemonList.add(pokemonInfo!);
      }
    }
    return fetchedPokemonList;
  }
}
