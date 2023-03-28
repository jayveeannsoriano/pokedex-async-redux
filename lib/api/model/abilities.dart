import 'package:freezed_annotation/freezed_annotation.dart';

part 'abilities.freezed.dart';

part 'abilities.g.dart';

@freezed
class Abilities with _$Abilities {
  factory Abilities({
    @JsonKey(name: 'ability') AbilityDetails? ability,
  }) = _Abilities;

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}

@freezed
class AbilityDetails with _$AbilityDetails {
  factory AbilityDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _AbilityDetails;

  factory AbilityDetails.fromJson(Map<String, dynamic> json) => _$AbilityDetailsFromJson(json);
}
