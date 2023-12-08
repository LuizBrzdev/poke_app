// ignore_for_file: no_leading_underscores_for_local_identifiers

class PokemonInfoEntity {
  PokemonInfoEntity({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.locationAreaEncounters,
    this.moves,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.pastTypes,
  });
  late final int? id;
  late final String? name;
  late final int? baseExperience;
  late final int? height;
  late final bool? isDefault;
  late final int? order;
  late final int? weight;
  late final List<Abilities>? abilities;
  late final List<Forms>? forms;
  late final List<GameIndices>? gameIndices;
  late final List<HeldItems>? heldItems;
  late final String? locationAreaEncounters;
  late final List<Moves>? moves;
  late final Species? species;
  late final Sprites? sprites;
  late final List<Stats>? stats;
  late final List<Types>? types;
  late final List<PastTypes>? pastTypes;

  PokemonInfoEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    baseExperience = json['base_experience'] ?? 0;
    height = json['height'] ?? 0;
    isDefault = json['is_default'] ?? false;
    order = json['order'] ?? 0;
    weight = json['weight'] ?? 0;
    abilities = json['abilities'] != null
        ? List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList()
        : [];
    forms = json['forms'] != null
        ? List.from(json['forms']).map((e) => Forms.fromJson(e)).toList()
        : [];
    gameIndices = json['game_indices'] != null
        ? List.from(json['game_indices']).map((e) => GameIndices.fromJson(e)).toList()
        : [];
    heldItems = json['held_items'] != null
        ? List.from(json['held_items']).map((e) => HeldItems.fromJson(e)).toList()
        : [];
    locationAreaEncounters = json['location_area_encounters'] ?? '';
    moves = json['moves'] != null
        ? List.from(json['moves']).map((e) => Moves.fromJson(e)).toList()
        : [];
    species = Species.fromJson(json['species']);
    sprites = Sprites.fromJson(json['sprites']);
    stats = json['stats'] != null
        ? List.from(json['stats']).map((e) => Stats.fromJson(e)).toList()
        : [];
    types = json['types'] != null
        ? List.from(json['types']).map((e) => Types.fromJson(e)).toList()
        : [];
    pastTypes = json['past_types'] != null
        ? List.from(json['past_types']).map((e) => PastTypes.fromJson(e)).toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['base_experience'] = baseExperience;
    _data['height'] = height;
    _data['is_default'] = isDefault;
    _data['order'] = order;
    _data['weight'] = weight;
    _data['abilities'] = abilities!.map((e) => e.toJson()).toList();
    _data['forms'] = forms!.map((e) => e.toJson()).toList();
    _data['game_indices'] = gameIndices!.map((e) => e.toJson()).toList();
    _data['held_items'] = heldItems!.map((e) => e.toJson()).toList();
    _data['location_area_encounters'] = locationAreaEncounters;
    _data['moves'] = moves!.map((e) => e.toJson()).toList();
    _data['species'] = species!.toJson();
    _data['sprites'] = sprites!.toJson();
    _data['stats'] = stats!.map((e) => e.toJson()).toList();
    _data['types'] = types!.map((e) => e.toJson()).toList();
    _data['past_types'] = pastTypes!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });
  late final bool isHidden;
  late final int slot;
  late final Ability ability;

  Abilities.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    ability = Ability.fromJson(json['ability']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_hidden'] = isHidden;
    _data['slot'] = slot;
    _data['ability'] = ability.toJson();
    return _data;
  }
}

class Ability {
  Ability({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Forms {
  Forms({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class GameIndices {
  GameIndices({
    required this.gameIndex,
    required this.version,
  });
  late final int gameIndex;
  late final Version version;

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['game_index'] = gameIndex;
    _data['version'] = version.toJson();
    return _data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class HeldItems {
  HeldItems({
    required this.item,
    required this.versionDetails,
  });
  late final Item item;
  late final List<VersionDetails> versionDetails;

  HeldItems.fromJson(Map<String, dynamic> json) {
    item = Item.fromJson(json['item']);
    versionDetails =
        List.from(json['version_details']).map((e) => VersionDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item'] = item.toJson();
    _data['version_details'] = versionDetails.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Item {
  Item({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class VersionDetails {
  VersionDetails({
    required this.rarity,
    required this.version,
  });
  late final int rarity;
  late final Version version;

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rarity'] = rarity;
    _data['version'] = version.toJson();
    return _data;
  }
}

class Moves {
  Moves({
    required this.move,
    required this.versionGroupDetails,
  });
  late final Move move;
  late final List<VersionGroupDetails> versionGroupDetails;

  Moves.fromJson(Map<String, dynamic> json) {
    move = Move.fromJson(json['move']);
    versionGroupDetails = List.from(json['version_group_details'])
        .map((e) => VersionGroupDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['move'] = move.toJson();
    _data['version_group_details'] = versionGroupDetails.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Move {
  Move({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class VersionGroupDetails {
  VersionGroupDetails({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });
  late final int levelLearnedAt;
  late final VersionGroup versionGroup;
  late final MoveLearnMethod moveLearnMethod;

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    versionGroup = VersionGroup.fromJson(json['version_group']);
    moveLearnMethod = MoveLearnMethod.fromJson(json['move_learn_method']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['level_learned_at'] = levelLearnedAt;
    _data['version_group'] = versionGroup.toJson();
    _data['move_learn_method'] = moveLearnMethod.toJson();
    return _data;
  }
}

class VersionGroup {
  VersionGroup({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class MoveLearnMethod {
  MoveLearnMethod({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.frontDefault,
    required this.other,
  });
  late final String backDefault;

  late final String frontDefault;

  late final Other other;

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];

    frontDefault = json['front_default'];

    other = Other.fromJson(json['other']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;

    _data['front_default'] = frontDefault;

    _data['other'] = other.toJson();

    return _data;
  }
}

class Other {
  Other({
    required this.dreamWorld,
    required this.officialartwork,
  });
  late final DreamWorld dreamWorld;

  late final Officialartwork officialartwork;

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = DreamWorld.fromJson(json['dream_world']);

    officialartwork = Officialartwork.fromJson(json['official-artwork']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dream_world'] = dreamWorld.toJson();

    _data['official-artwork'] = officialartwork.toJson();
    return _data;
  }
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
  });
  late final String frontDefault;

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;

    return _data;
  }
}

class Officialartwork {
  Officialartwork({
    required this.frontDefault,
  });
  late final String frontDefault;

  Officialartwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    return _data;
  }
}

class Yellow {
  Yellow({
    required this.backDefault,
    required this.backGray,
    required this.frontDefault,
    required this.frontGray,
  });
  late final String backDefault;
  late final String backGray;
  late final String frontDefault;
  late final String frontGray;

  Yellow.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_gray'] = backGray;
    _data['front_default'] = frontDefault;
    _data['front_gray'] = frontGray;
    return _data;
  }
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;

  Crystal.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_shiny'] = backShiny;
    _data['front_default'] = frontDefault;
    _data['front_shiny'] = frontShiny;
    return _data;
  }
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;

  Gold.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_shiny'] = backShiny;
    _data['front_default'] = frontDefault;
    _data['front_shiny'] = frontShiny;
    return _data;
  }
}

class Silver {
  Silver({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;

  Silver.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['back_default'] = backDefault;
    _data['back_shiny'] = backShiny;
    _data['front_default'] = frontDefault;
    _data['front_shiny'] = frontShiny;
    return _data;
  }
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String frontDefault;
  late final String frontShiny;

  Emerald.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;
    _data['front_shiny'] = frontShiny;
    return _data;
  }
}

class Icons {
  Icons({
    required this.frontDefault,
  });
  late final String frontDefault;

  Icons.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['front_default'] = frontDefault;

    return _data;
  }
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_stat'] = baseStat;
    _data['effort'] = effort;
    _data['stat'] = stat.toJson();
    return _data;
  }
}

class Stat {
  Stat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Types {
  Types({
    required this.slot,
    required this.type,
  });
  late final int slot;
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot'] = slot;
    _data['type'] = type.toJson();
    return _data;
  }
}

class Type {
  Type({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class PastTypes {
  PastTypes({
    required this.generation,
    required this.types,
  });
  late final Generation generation;
  late final List<Types> types;

  PastTypes.fromJson(Map<String, dynamic> json) {
    generation = Generation.fromJson(json['generation']);
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['generation'] = generation.toJson();
    _data['types'] = types.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Generation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
