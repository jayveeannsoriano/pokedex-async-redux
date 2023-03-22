import 'package:freezed_annotation/freezed_annotation.dart';

part 'moves.freezed.dart';

part 'moves.g.dart';

@freezed
class Moves with _$Moves {
  factory Moves({
    @JsonKey(name: 'move') MoveDetails? move,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}

@freezed
class MoveDetails with _$MoveDetails {
  factory MoveDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _MoveDetails;

  factory MoveDetails.fromJson(Map<String, dynamic> json) => _$MoveDetailsFromJson(json);
}
