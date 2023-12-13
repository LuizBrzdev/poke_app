import 'package:poke_app/src/modules/home/domain/usecases/fetch_pokemon_use_case.dart';

import '../entities/pokemon_info_entity.dart';
import '../entities/pokemon_list_entity.dart';

import '../repository/home_repository.dart';

class FetchPokemonUseCaseImp implements FetchPokemonUseCase {
  final HomeRepository _homeRepository;

  FetchPokemonUseCaseImp({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  @override
  Future<PokemonBasicEntity?> fetchPokemonsList() async {
    return _homeRepository.fetchPokemonsList();
  }

  @override
  Future<PokemonInfoEntity?> fetchPokemonInfo({required String pokemonName}) async {
    return _homeRepository.fetchPokemonInfo(pokemonName: pokemonName);
  }

  @override
  Future<PokemonBasicEntity?> fetchPokemonByUrl({required String url}) async {
    return _homeRepository.fetchPokemonByUrl(url: url);
  }

  @override
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
