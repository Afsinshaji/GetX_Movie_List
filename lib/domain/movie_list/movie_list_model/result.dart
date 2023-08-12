import 'package:json_annotation/json_annotation.dart';

import '../../../core/strings.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get() => '$imageAppendUrl$posterPath';
  Result({this.originalTitle, this.posterPath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
