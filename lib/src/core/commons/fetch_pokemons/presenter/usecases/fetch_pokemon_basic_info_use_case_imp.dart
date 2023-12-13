import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';

import '../../domain/repositories/fetch_pokemon_basic_info_repository.dart';
import '../../domain/usecases/fetch_pokemon_basic_info_use_case.dart';

class FetchPokemonBasicInfoUseCaseImp implements FetchPokemonBasicInfoUseCase {
  final FetchPokemonBasicInfoRepository _fetchPokemonBasicInfoRepository;

  FetchPokemonBasicInfoUseCaseImp(this._fetchPokemonBasicInfoRepository);

  @override
  Future<PokemonBasicEntity> execute() async => _fetchPokemonBasicInfoRepository.execute();
}
