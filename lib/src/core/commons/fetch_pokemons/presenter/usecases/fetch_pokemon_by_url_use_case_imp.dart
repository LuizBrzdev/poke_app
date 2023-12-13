import 'package:poke_app/src/core/commons/fetch_pokemons/domain/repositories/fetch_pokemon_by_url_repository.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';

import '../../domain/usecases/fetch_pokemon_by_url_use_case.dart';

class FetchPokemonByUrlUseCaseImp implements FetchPokemonByUrlUseCase {
  final FetchPokemonByUrlRepository _fetchPokemonByUrlRepository;

  FetchPokemonByUrlUseCaseImp(this._fetchPokemonByUrlRepository);

  @override
  Future<PokemonBasicEntity> execute({required String url}) async =>
      _fetchPokemonByUrlRepository.execute(url: url);
}
