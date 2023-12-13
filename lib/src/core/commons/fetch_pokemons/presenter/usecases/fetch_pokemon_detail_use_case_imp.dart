import 'package:poke_app/src/core/commons/fetch_pokemons/domain/repositories/fetch_pokemon_detail_repository.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_info_entity.dart';

import '../../domain/usecases/fetch_pokemon_detail_use_case.dart';

class FetchPokemonDetailUseCaseImp implements FetchPokemonDetailUseCase {
  final FetchPokemonDetailRepository _fetchPokemonDetailRepository;

  FetchPokemonDetailUseCaseImp(this._fetchPokemonDetailRepository);
  @override
  Future<PokemonInfoEntity> execute({required String pokemonName}) async =>
      await _fetchPokemonDetailRepository.execute(pokemonName: pokemonName);
}
