import 'package:poke_app/src/settings/bindings/features/home_bindings.dart';
import 'package:poke_app/src/settings/bindings/features/pokemon_detail_bindings.dart';

class FeaturesBindings {
  static FeaturesBindings? _instance;
  // Avoid self instance
  FeaturesBindings._();
  static FeaturesBindings get instance => _instance ??= FeaturesBindings._();

  void initAllDependecies() {
    HomeBindings.init();
    PokemonDetailBindings.init();
  }
}
