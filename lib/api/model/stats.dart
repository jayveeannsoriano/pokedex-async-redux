import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: 'base_stat') required double baseStat,
    @JsonKey(name: 'stat') required StatDetails stat,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@freezed
class StatDetails with _$StatDetails {
  const factory StatDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _StatDetails;

  factory StatDetails.fromJson(Map<String, dynamic> json) => _$StatDetailsFromJson(json);
}
